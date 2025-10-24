return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gs = require("gitsigns")
			gs.setup()
			vim.keymap.set("n", "<leader>gj", gs.next_hunk, { desc = "Siguiente cambio (hunk)" })
			vim.keymap.set("n", "<leader>gk", gs.prev_hunk, { desc = "Cambio (hunk) anterior" })
			vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Guardar cambio (hunk)" })
			vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Deshacer cambio (hunk)" })
			vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Reiniciar cambio (hunk)" })
			vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { desc = "Reiniciar todo el buffer" })
			vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Previsualizar cambio" })
			vim.keymap.set("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { desc = "Blame línea actual" })
			vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Diff contra HEAD" })
		end,
	},

	{
		"TimUntersberger/neogit",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Neogit",
		keys = {
			{
				"<leader>go",
				function()
					require("neogit").open()
				end,
				desc = "Abrir Neogit",
			},
		},
		config = function()
			require("neogit").setup()
		end,
	},

	{
		"f-person/git-blame.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "GitBlameToggle" },
		keys = {
			{ "<leader>gt", "<cmd>GitBlameToggle<CR>", desc = "Alternar Git Blame" },
		},
		init = function()
			vim.g.gitblame_enabled = 0
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		cmd = "LazyGit",
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<CR>", desc = "Abrir LazyGit" },
		},
	},
}
