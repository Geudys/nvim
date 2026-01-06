return {
	{
		"obsidian-nvim/obsidian.nvim",
		lazy = true,
		event = "VeryLazy",
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },

		opts = {
			workspaces = {
				{
					name = "Obsidian",
					path = "/home/geudys/Desktop/Obsidian/",
				},
			},

			completion = {
				nvim_cmp = false,
			},

			finder = {
				max_results = 50,
			},

			picker = {
				name = "telescope.nvim",
			},

			ui = {
				enable = false,
			},

			frontmatter = {
				enabled = false,
			},

			footer = {
				enabled = false,
				separator = false,
			},

			legacy_commands = false,

			templates = {
				subdir = "99 - Templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				substitutions = {
					Date = function()
						return os.date("%Y-%m-%d")
					end,
					Time = function()
						return os.date("%H:%M")
					end,
					["Date:YYYYMMDDHHmm"] = function()
						return os.date("%Y%m%d%H%M")
					end,
				},
			},
		},

		config = function(_, opts)
			local obsidian = require("obsidian")
			obsidian.setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.conceallevel = 2
				end,
			})
			local map = vim.keymap.set
			local key_opts = { noremap = true, silent = true }

			map("n", "<leader>oo", ":Obsidian tags<CR>", key_opts)
			map("n", "<leader>os", ":Obsidian quick_switch<CR>", key_opts)
			map("n", "<leader>or", ":Obsidian rename<CR>", key_opts)
			map("n", "<leader>of", ":Obsidian search<CR>", key_opts)
			map("n", "<leader>ol", ":Obsidian links<CR>", key_opts)
			map("n", "<leader>ob", ":Obsidian backlinks<CR>", key_opts)
			map("n", "<leader>ot", ":Obsidian template<CR>", key_opts)

			map("n", "<leader>od", function()
				local daily_dir = "/home/geudys/Desktop/Obsidian/05 - Daily/Daily 2026/Daily 2026-01/"
				local filename = "Daily " .. os.date("%Y-%m-%d") .. ".md"
				local filepath = daily_dir .. filename
				if vim.fn.filereadable(filepath) == 0 then
					vim.fn.writefile({}, filepath)
					vim.notify("🗓️ Nueva Daily Note creada: " .. filename, vim.log.levels.INFO)
				else
					vim.notify("✅ Ya existe la Daily Note de hoy.", vim.log.levels.INFO)
				end
				vim.cmd("edit " .. filepath)
			end, { desc = "Obsidian daily" })

			map("n", "<leader>ou", function()
				local Path = require("plenary.path")
				local target_dir = "/home/geudys/Desktop/Obsidian/"
				local filename = "- " .. os.date("%Y%m%d%H%M") .. ".md"
				local filepath = Path:new(target_dir .. filename)
				vim.cmd("edit " .. filepath.filename)
				vim.notify("📝 Nueva nota creada: " .. filename, vim.log.levels.INFO)
			end, { desc = "Obsidian note" })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			render_modes = { "n", "v", "i", "c" },

			checkbox = {
				unchecked = { icon = " " },
				checked = { icon = " " },

				custom = {
					info = {
						raw = "[>]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
					},
					warn = {
						raw = "[!]",
						rendered = " ",
						highlight = "RenderMarkdownWarn",
					},
					error = {
						raw = "[~]",
						rendered = " ",
						highlight = "RenderMarkdownError",
					},
				},
			},

			html = { enabled = false },
			latex = { enabled = false },
			yaml = { enabled = false },
		},
	},
}
