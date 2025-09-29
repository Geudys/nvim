return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true, -- mostrar archivos ocultos
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
			})
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
			vim.keymap.set("n", "<leader>E", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })
			vim.keymap.set("n", "<leader>ge", ":Neotree git_status<CR>", { desc = "Git status en Neo-tree" })
			vim.keymap.set("n", "<leader>be", ":Neotree buffers<CR>", { desc = "Buffers en Neo-tree" })
		end,
	},
}
