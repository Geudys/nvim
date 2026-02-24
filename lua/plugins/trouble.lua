return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {
		win = {
			size = 40,
		},
		use_diagnostic_signs = true,
	},
	keys = function()
		local map = vim.keymap.set
		local opts = { silent = true }

		map(
			"n",
			"<leader>xx",
			"<cmd>Trouble toggle win.position=left<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Trouble toggle",
			})
		)

		map(
			"n",
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle win.position=left<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Diagnostics",
			})
		)

		map(
			"n",
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0 win.position=left<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Buffer diagnostics",
			})
		)

		map(
			"n",
			"<leader>xs",
			"<cmd>Trouble symbols toggle win.position=left<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Symbols / Outline",
			})
		)

		map(
			"n",
			"<leader>xr",
			"<cmd>Trouble lsp togglewin.position=left<cr>",
			vim.tbl_extend("force", opts, {
				desc = "LSP references",
			})
		)
	end,
}
