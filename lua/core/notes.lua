local M = {}

-- Config
M.config = {
	vault = "/home/geudys/Desktop/Obsidian/",
	templates_dir = "99 - Templates/",
}

local VAULT = M.config.vault
local TEMPLATES = VAULT .. M.config.templates_dir

-- Telescope global setup
require("telescope").setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = " ",
		path_display = { "smart" },
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.35,
			},
		},
	},
})

-- Requires
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Helpers: FS
local fs = {}

function fs.edit_or_create(path)
	if vim.fn.filereadable(path) == 0 then
		vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
		vim.fn.writefile({}, path)
	end
	vim.cmd("edit " .. vim.fn.fnameescape(path))
end

function fs.find_md(root)
	return vim.fn.globpath(root, "**/*.md", false, true)
end

-- Relative path the vault
function fs.relative(path)
	return path:gsub("^" .. vim.pesc(VAULT), "")
end

-- Helpers: Buffer
local buffer = {}

function buffer.read()
	return vim.api.nvim_buf_get_lines(0, 0, -1, false)
end

function buffer.insert_top(lines)
	vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
end

function buffer.current_note()
	return vim.fn.expand("%:t:r")
end

-- Helpers: Utils
local utils = {}

function utils.unique(list)
	local seen, out = {}, {}
	for _, v in ipairs(list) do
		if not seen[v] then
			seen[v] = true
			table.insert(out, v)
		end
	end
	return out
end

-- Helpers: Telescope
local function open_picker(opts)
	pickers
		.new({}, {
			prompt_title = opts.title,
			finder = finders.new_table({
				results = opts.results,
				entry_maker = opts.entry_maker,
			}),
			sorter = conf.generic_sorter({}),
			previewer = conf.file_previewer({}),
			attach_mappings = opts.attach,
		})
		:find()
end

-- Templates
local function apply_template(lines)
	local date = os.date("%Y-%m-%d")
	local time = os.date("%H:%M")
	local datetime = os.date("%Y%m%d%H%M")

	local out = {}
	for _, line in ipairs(lines) do
		line = line:gsub("{{Date}}", date):gsub("{{Time}}", time):gsub("{{Date:YYYYMMDDHHmm}}", datetime)
		table.insert(out, line)
	end
	return out
end

function M.pick_template()
	local templates = vim.fn.glob(TEMPLATES .. "*.md", false, true)
	if vim.tbl_isempty(templates) then
		return vim.notify("No hay templates", vim.log.levels.WARN)
	end

	open_picker({
		title = "Templates",
		results = templates,
		entry_maker = function(path)
			local rel = fs.relative(path)
			return {
				value = path,
				display = rel,
				ordinal = rel,
				path = path,
			}
		end,
		attach = function(buf)
			actions.select_default:replace(function()
				actions.close(buf)
				local e = action_state.get_selected_entry()
				if not e or not e.path then
					return
				end
				buffer.insert_top(apply_template(vim.fn.readfile(e.path)))
			end)
			return true
		end,
	})
end

-- Notes
function M.new_note()
	local name = "- " .. os.date("%Y%m%d%H%M") .. ".md"
	fs.edit_or_create(VAULT .. name)
end

function M.daily_note()
	local dir = VAULT .. "05 - Daily/Daily 2026/Daily 2026-02/"
	local name = "Daily " .. os.date("%Y-%m-%d") .. ".md"
	fs.edit_or_create(dir .. name)
end

-- Backlinks
function M.backlinks()
	local note = buffer.current_note()
	local results = vim.fn.systemlist({
		"rg",
		"\\[\\[" .. note .. "(\\||\\]\\])",
		VAULT,
		"--glob",
		"*.md",
	})

	if vim.v.shell_error ~= 0 or #results == 0 then
		return vim.notify("No hay backlinks")
	end

	local files = {}
	for _, line in ipairs(results) do
		local file = line:match("^([^:]+):")
		if file then
			table.insert(files, file)
		end
	end

	open_picker({
		title = "Backlinks",
		results = utils.unique(files),
		entry_maker = function(path)
			local rel = fs.relative(path)
			return {
				value = path,
				display = rel,
				ordinal = rel,
				path = path,
			}
		end,
	})
end

-- Links
function M.links()
	local entries, seen = {}, {}

	for _, line in ipairs(buffer.read()) do
		for raw in line:gmatch("%[%[([^%]]+)%]%]") do
			local name = raw:match("^[^|]+")
			if not seen[name] then
				seen[name] = true
				local match = vim.fn.globpath(VAULT, "**/" .. name .. ".md", false, true)[1]
				table.insert(entries, {
					display = match and fs.relative(match) or name .. " (no existe)",
					path = match,
				})
			end
		end
	end

	if vim.tbl_isempty(entries) then
		return vim.notify("No hay links")
	end

	open_picker({
		title = "Links",
		results = entries,
		entry_maker = function(e)
			return {
				value = e,
				display = e.display,
				ordinal = e.display,
				path = e.path,
			}
		end,
		attach = function(buf)
			actions.select_default:replace(function()
				actions.close(buf)
				local e = action_state.get_selected_entry()
				if e.path then
					vim.cmd("edit " .. vim.fn.fnameescape(e.path))
				end
			end)
			return true
		end,
	})
end

-- Search Notes
function M.Search()
	local files = fs.find_md(VAULT)
	if vim.tbl_isempty(files) then
		return vim.notify("No hay notas")
	end

	open_picker({
		title = "Notes",
		results = files,
		entry_maker = function(path)
			local rel = fs.relative(path)
			return {
				value = path,
				display = rel,
				ordinal = rel,
				path = path,
			}
		end,
		attach = function(buf)
			actions.select_default:replace(function()
				actions.close(buf)
				local e = action_state.get_selected_entry()
				if e and e.path then
					vim.cmd("edit " .. vim.fn.fnameescape(e.path))
				end
			end)
			return true
		end,
	})
end

-- Tags
-- Tags (frontmatter YAML)
function M.tags()
	-- 1. Buscar archivos que tengan tags en frontmatter
	local files = vim.fn.systemlist({
		"rg",
		"^tags:",
		VAULT,
		"--glob",
		"*.md",
		"--files-with-matches",
	})

	if vim.v.shell_error ~= 0 or vim.tbl_isempty(files) then
		return vim.notify("No hay tags en el vault")
	end

	-- 2. Extraer tags desde el frontmatter
	local tags, seen = {}, {}

	for _, file in ipairs(files) do
		local lines = vim.fn.readfile(file)
		local in_frontmatter = false
		local in_tags = false

		for _, line in ipairs(lines) do
			if line == "---" then
				in_frontmatter = not in_frontmatter
				in_tags = false
			elseif in_frontmatter and line:match("^tags:%s*$") then
				in_tags = true
			elseif in_frontmatter and in_tags then
				local tag = line:match("^%s*-%s*(.+)")
				if tag then
					if not seen[tag] then
						seen[tag] = true
						table.insert(tags, tag)
					end
				else
					-- Salimos de la lista si ya no es un item
					in_tags = false
				end
			end
		end
	end

	if vim.tbl_isempty(tags) then
		return vim.notify("No se encontraron tags válidos")
	end

	table.sort(tags)

	-- 3. Picker de tags
	open_picker({
		title = "Tags",
		results = tags,
		entry_maker = function(tag)
			return {
				value = tag,
				display = tag,
				ordinal = tag,
			}
		end,
		attach = function(buf)
			actions.select_default:replace(function()
				actions.close(buf)
				local entry = action_state.get_selected_entry()
				if not entry then
					return
				end

				local tag = entry.value
				local matches = {}

				-- 4. Buscar notas que contengan ese tag
				for _, file in ipairs(files) do
					local lines = vim.fn.readfile(file)
					local in_frontmatter = false
					local in_tags = false

					for _, line in ipairs(lines) do
						if line == "---" then
							in_frontmatter = not in_frontmatter
							in_tags = false
						elseif in_frontmatter and line:match("^tags:%s*$") then
							in_tags = true
						elseif in_frontmatter and in_tags then
							if line:match("^%s*-%s*" .. vim.pesc(tag) .. "%s*$") then
								table.insert(matches, file)
								break
							end
						end
					end
				end

				if vim.tbl_isempty(matches) then
					return vim.notify("No hay notas con el tag " .. tag)
				end

				open_picker({
					title = "Notas con tag: " .. tag,
					results = matches,
					entry_maker = function(path)
						local rel = fs.relative(path)
						return {
							value = path,
							display = rel,
							ordinal = rel,
							path = path,
						}
					end,
					attach = function(buf2)
						actions.select_default:replace(function()
							actions.close(buf2)
							local e = action_state.get_selected_entry()
							if e and e.path then
								vim.cmd("edit " .. vim.fn.fnameescape(e.path))
							end
						end)
						return true
					end,
				})
			end)
			return true
		end,
	})
end

-- Keymaps
function M.setup()
	local map = vim.keymap.set

	map("n", "<leader>on", M.new_note, { desc = "New Note" })
	map("n", "<leader>od", M.daily_note, { desc = "Daily Note" })
	map("n", "<leader>ot", M.pick_template, { desc = "Template" })
	map("n", "<leader>ob", M.backlinks, { desc = "Backlinks" })
	map("n", "<leader>ol", M.links, { desc = "Links" })
	map("n", "<leader>of", M.Search, { desc = "Search Notes" })
	map("n", "<leader>os", M.tags, { desc = "Tags" })
end

return M
