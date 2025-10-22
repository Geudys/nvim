return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")

			telescope.setup({})

			vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")
			vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<CR>")
			vim.keymap.set("n", "<leader>ti", "<cmd>Telescope live_grep<CR>")
			vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<CR>")
			vim.keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<CR>")
			vim.keymap.set("n", "<leader>tc", "<cmd>Telescope grep_string<CR>")
			vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<CR>")
			vim.keymap.set("n", "<leader>tl", "<cmd>Telescope lazy<CR>")
			vim.keymap.set("n", "<leader>tgc", "<cmd>Telescope git_commits<CR>")
			vim.keymap.set("n", "<leader>tgf", "<cmd>Telescope git_files<CR>")
			vim.keymap.set("n", "<leader>tgb", "<cmd>Telescope git_branches<CR>")
			vim.keymap.set("n", "<leader>tgs", "<cmd>Telescope git_status<CR>")
		end,
	},
}
