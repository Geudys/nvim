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

		map("n", "<leader>xx", "<cmd>Trouble toggle<cr>", {
			desc = "Trouble toggle",
			silent = true,
		})

		map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
			desc = "Diagnostics (buffer)",
			silent = true,
		})

		map("n", "<leader>xD", "<cmd>Trouble diagnostics toggle<cr>", {
			desc = "Diagnostics (workspace)",
			silent = true,
		})

		map("n", "<leader>xs", "<cmd>Trouble symbols win.position=left<cr>", {
			desc = "Symbols / Outline (buffer)",
			silent = true,
		})

		map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle filter.buf=0<cr>", {
			desc = "LSP references (buffer)",
			silent = true,
		})

		map("n", "<leader>xR", "<cmd>Trouble lsp_references toggle<cr>", {
			desc = "LSP references (workspace)",
			silent = true,
		})

		map("n", "<leader>xl", "<cmd>Trouble lsp_definitions toggle filter.buf=0<cr>", {
			desc = "LSP definitions (buffer)",
			silent = true,
		})

		map("n", "<leader>xL", "<cmd>Trouble lsp_definitions toggle<cr>", {
			desc = "LSP definitions (workspace)",
			silent = true,
		})

		map("n", "<leader>xi", "<cmd>Trouble lsp_implementations toggle filter.buf=0<cr>", {
			desc = "LSP implementations (buffer)",
			silent = true,
		})

		map("n", "<leader>xI", "<cmd>Trouble lsp_implementations toggle<cr>", {
			desc = "LSP implementations (workspace)",
			silent = true,
		})

		map("n", "<leader>xt", "<cmd>Trouble lsp_type_definitions toggle filter.buf=0<cr>", {
			desc = "LSP type definitions (buffer)",
			silent = true,
		})

		map("n", "<leader>xT", "<cmd>Trouble lsp_type_definitions toggle<cr>", {
			desc = "LSP type definitions (workspace)",
			silent = true,
		})
	end,
}
