return {
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		event = "VeryLazy",
		version = "*",
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			workspaces = {
				{
					name = "Obsidian",
					path = "/mnt/c/My Desktop/GPS/Obsidian/",
				},
			},

			completion = { nvim_cmp = true, min_chars = 3 },
			finder = { max_results = 50 },
			picker = { name = "telescope.nvim" },
			ui = { enable = true },
			disable_frontmatter = true,

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

			map("n", "<leader>on", ":ObsidianNew<CR>", key_opts)
			map("n", "<leader>oo", ":ObsidianOpen<CR>", key_opts)
			map("n", "<leader>os", ":ObsidianSearch<CR>", key_opts)
			map("n", "<leader>ol", ":ObsidianLink<CR>", key_opts)
			map("n", "<leader>ob", ":ObsidianBacklinks<CR>", key_opts)
			map("n", "<leader>ot", ":ObsidianTemplate<CR>", key_opts)

			map("n", "<leader>od", function()
				local daily_dir = "/mnt/c/My Desktop/GPS/Obsidian/06 - Daily/Daily 2025/Daily 2025-10/"
				local filename = "Daily " .. os.date("%Y-%m-%d") .. ".md"
				local filepath = daily_dir .. filename

				if vim.fn.filereadable(filepath) == 0 then
					vim.fn.writefile({}, filepath)
					vim.notify("🗓️ Nueva Daily Note creada: " .. filename, vim.log.levels.INFO)
				else
					vim.notify("✅ Ya existe la Daily Note de hoy.", vim.log.levels.INFO)
				end

				vim.cmd("edit " .. filepath)
			end, { desc = "ObsidianDaily" }, key_opts)
			map("n", "<leader>ou", function()
				local Path = require("plenary.path")

				local target_dir = "/mnt/c/My Desktop/GPS/Obsidian/"
				local filename = "- " .. os.date("%Y%m%d%H%M") .. ".md"
				local filepath = Path:new(target_dir .. filename)

				vim.cmd("edit " .. filepath.filename)

				vim.notify("📝 Nueva nota creada: " .. filename, vim.log.levels.INFO)
			end, { desc = "ObsidianNote" }, key_opts)
		end,
	},
}
