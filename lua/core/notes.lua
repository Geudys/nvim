-- lua/notes.lua
local M = {}

-- ======================
-- CONFIG
-- ======================
M.vault = "/home/geudys/Desktop/Obsidian/"
M.templates_dir = M.vault .. "99 - Templates/"

-- ======================
-- HELPERS
-- ======================
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

-- ======================
-- TEMPLATE SUBSTITUTIONS
-- ======================
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

-- ======================
-- NOTES
-- ======================
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

-- ======================
-- TEMPLATES (TELESCOPE)
-- ======================
function M.pick_template()
	-- asegúrate de que Telescope esté cargado
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

-- ======================
-- KEYMAPS
-- ======================
function M.setup()
	local map = vim.keymap.set

	map("n", "<leader>ou", M.new_note, { desc = "Nueva Nota" })
	map("n", "<leader>od", M.daily_note, { desc = "Daily Note" })
	map("n", "<leader>ot", M.pick_template, { desc = "Insert Template" })
end

return M
