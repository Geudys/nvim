return {
	{
		"mbbill/undotree",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.undotree_WindowLayout = 3

			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
		end,
	},
}
