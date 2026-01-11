local M = {}

-- Path
M.vault = "/home/geudys/Desktop/Obsidian/"
M.templates_dir = M.vault .. "99 - Templates/"

-- Helpers
local function edit_or_create(path)
	if vim.fn.filereadable(path) == 0 then
		vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
		vim.fn.writefile({}, path)
	end
	vim.cmd("edit " .. vim.fn.fnameescape(path))
end

local function insert_lines_at_top(lines)
	vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
end

-- Notes
function M.new_note()
	local filename = "- " .. os.date("%Y%m%d%H%M") .. ".md"
	local path = M.vault .. filename
	edit_or_create(path)
end

function M.daily_note()
	local dir = M.vault .. "05 - Daily/Daily 2026/Daily 2026-01/"
	local filename = "Daily " .. os.date("%Y-%m-%d") .. ".md"
	local path = dir .. filename
	edit_or_create(path)
end

-- Template substitutions
local function apply_substitutions(lines)
	local date = os.date("%Y-%m-%d")
	local time = os.date("%H:%M")
	local datetime = os.date("%Y%m%d%H%M")

	local out = {}

	for _, line in ipairs(lines) do
		line = line:gsub("{{Date}}", date)
		line = line:gsub("{{Time}}", time)
		line = line:gsub("{{Date:YYYYMMDDHHmm}}", datetime)
		table.insert(out, line)
	end

	return out
end

-- Templates
function M.pick_template()
	local ok = pcall(require, "telescope")
	if not ok then
		vim.notify("Telescope no está disponible", vim.log.levels.ERROR)
		return
	end

	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local templates = vim.fn.glob(M.templates_dir .. "*.md", false, true)
	if vim.tbl_isempty(templates) then
		vim.notify("No hay templates en " .. M.templates_dir, vim.log.levels.WARN)
		return
	end

	pickers
		.new({}, {
			prompt_title = "Templates",
			finder = finders.new_table({
				results = templates,
				entry_maker = function(path)
					return {
						value = path,
						display = vim.fn.fnamemodify(path, ":t"),
						ordinal = path,
						path = path,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local entry = action_state.get_selected_entry()
					if not entry or not entry.path then
						return
					end

					local raw = vim.fn.readfile(entry.path)
					local lines = apply_substitutions(raw)
					insert_lines_at_top(lines)
				end)
				return true
			end,
		})
		:find()
end

-- Methods
local function current_note_name()
	return vim.fn.expand("%:t:r")
end

local function read_current_buffer()
	return vim.api.nvim_buf_get_lines(0, 0, -1, false)
end

local function unique(list)
	local seen = {}
	local out = {}
	for _, v in ipairs(list) do
		if not seen[v] then
			seen[v] = true
			table.insert(out, v)
		end
	end
	return out
end

-- Backlinks
function M.backlinks()
	local note = current_note_name()
	local cmd = {
		"rg",
		"\\[\\[" .. note .. "(\\||\\]\\])",
		M.vault,
		"--glob",
		"*.md",
	}

	local results = vim.fn.systemlist(cmd)
	if vim.v.shell_error ~= 0 then
		vim.notify("rg no encontrado o error", vim.log.levels.ERROR)
		return
	end

	if #results == 0 then
		vim.notify("No hay backlinks")
		return
	end

	local files = {}
	for _, line in ipairs(results) do
		local file = line:match("^([^:]+):")
		if file then
			table.insert(files, file)
		end
	end

	files = unique(files)

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Backlinks",
			finder = require("telescope.finders").new_table(files),
			sorter = require("telescope.config").values.generic_sorter({}),
		})
		:find()
end

-- Links
function M.links()
	local lines = read_current_buffer()
	local vault = M.vault
	local entries = {}

	local seen = {}

	for _, line in ipairs(lines) do
		for raw in line:gmatch("%[%[([^%]]+)%]%]") do
			local name = raw:match("^[^|]+")
			if not seen[name] then
				seen[name] = true

				local matches = vim.fn.globpath(vault, "**/" .. name .. ".md", false, true)

				if #matches > 0 then
					table.insert(entries, {
						display = name,
						path = matches[1],
					})
				else
					table.insert(entries, {
						display = name .. " (no existe)",
						path = nil,
					})
				end
			end
		end
	end

	if #entries == 0 then
		vim.notify("No hay links en el archivo")
		return
	end

	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	pickers
		.new({}, {
			prompt_title = "Links",
			finder = finders.new_table({
				results = entries,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.display,
						ordinal = entry.display,
						path = entry.path,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection.path then
						vim.cmd("edit " .. selection.path)
					else
						vim.notify("La nota no existe", vim.log.levels.WARN)
					end
				end)
				return true
			end,
		})
		:find()
end

-- Tags
function M.tags()
	local lines = read_current_buffer()
	local tags = {}

	local in_yaml = false

	for _, line in ipairs(lines) do
		if line == "---" then
			in_yaml = not in_yaml
		end

		if in_yaml and line:match("^%s*-%s+") then
			local tag = line:match("^%s*-%s+(%S+)")
			if tag then
				table.insert(tags, tag)
			end
		end

		for tag in line:gmatch("#([%w-_]+)") do
			table.insert(tags, tag)
		end
	end

	tags = unique(tags)

	if #tags == 0 then
		vim.notify("No hay tags")
		return
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Tags",
			finder = require("telescope.finders").new_table(tags),
			sorter = require("telescope.config").values.generic_sorter({}),
		})
		:find()
end

-- Keymaps
function M.setup()
	local map = vim.keymap.set

	map("n", "<leader>ou", M.new_note, { desc = "New Note" })
	map("n", "<leader>od", M.daily_note, { desc = "Daily Note" })
	map("n", "<leader>ot", M.pick_template, { desc = "Template" })
	map("n", "<leader>ob", M.backlinks, { desc = "Backlinks" })
	map("n", "<leader>ol", M.links, { desc = "Links" })
	map("n", "<leader>og", M.tags, { desc = "Tags" })
end

return M
