return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {
		win = {
			position = "left",
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
			"<cmd>Trouble toggle<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Trouble toggle",
			})
		)

		map(
			"n",
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Diagnostics (workspace)",
			})
		)

		map(
			"n",
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Diagnostics (buffer)",
			})
		)

		map(
			"n",
			"<leader>xs",
			"<cmd>Trouble symbols win.position=left<cr>",
			vim.tbl_extend("force", opts, {
				desc = "Symbols / Outline",
			})
		)

		map(
			"n",
			"<leader>xr",
			"<cmd>Trouble lsp_references toggle<cr>",
			vim.tbl_extend("force", opts, {
				desc = "LSP references",
			})
		)

		map(
			"n",
			"<leader>xd",
			"<cmd>Trouble lsp_definitions toggle<cr>",
			vim.tbl_extend("force", opts, {
				desc = "LSP definitions",
			})
		)

		map(
			"n",
			"<leader>xi",
			"<cmd>Trouble lsp_implementations toggle<cr>",
			vim.tbl_extend("force", opts, {
				desc = "LSP implementations",
			})
		)

		map(
			"n",
			"<leader>xt",
			"<cmd>Trouble lsp_type_definitions toggle<cr>",
			vim.tbl_extend("force", opts, {
				desc = "LSP type definitions",
			})
		)
	end,
}
