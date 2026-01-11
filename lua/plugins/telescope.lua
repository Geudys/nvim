return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
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

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<leader><space>", builtin.find_files, { desc = "Buscar archivos", unpack(opts) })
			map("n", "<leader>tb", builtin.buffers, { desc = "Buffers abiertos", unpack(opts) })
			map("n", "<leader>tr", builtin.oldfiles, { desc = "Archivos recientes", unpack(opts) })
			map("n", "<leader>tk", builtin.keymaps, { desc = "Keymaps", unpack(opts) })

			map("n", "<leader>tF", function()
				builtin.find_files({
					hidden = true,
					no_ignore = true,
				})
			end, { desc = "Buscar archivos (profundo)", unpack(opts) })

			map("n", "<leader>ti", builtin.live_grep, { desc = "Buscar texto (live grep)", unpack(opts) })
			map("n", "<leader>tc", builtin.grep_string, { desc = "Buscar palabra bajo cursor", unpack(opts) })

			map("n", "<leader>tld", builtin.lsp_definitions, { desc = "LSP definiciones", unpack(opts) })
			map("n", "<leader>tlr", builtin.lsp_references, { desc = "LSP referencias", unpack(opts) })
			map("n", "<leader>tli", builtin.lsp_implementations, { desc = "LSP implementaciones", unpack(opts) })
			map("n", "<leader>tlt", builtin.lsp_type_definitions, { desc = "LSP tipos", unpack(opts) })
			map(
				"n",
				"<leader>tls",
				builtin.lsp_document_symbols,
				{ desc = "LSP símbolos del documento", unpack(opts) }
			)
			map(
				"n",
				"<leader>tlS",
				builtin.lsp_workspace_symbols,
				{ desc = "LSP símbolos del workspace", unpack(opts) }
			)

			map("n", "<leader>tgc", builtin.git_commits, { desc = "Git commits", unpack(opts) })
			map("n", "<leader>tgf", builtin.git_files, { desc = "Git archivos", unpack(opts) })
			map("n", "<leader>tgb", builtin.git_branches, { desc = "Git ramas", unpack(opts) })
			map("n", "<leader>tgs", builtin.git_status, { desc = "Git estado", unpack(opts) })
		end,
	},
}
