return {
	{
		"michaelb/sniprun",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		build = "bash ./install.sh",
		config = function()
			require("sniprun").setup({
				selected_interpreters = { "JS_TS_original" },
				display = { "VirtualTextOk", "Terminal" },
			})

			vim.keymap.set("n", "<leader>cr", ":SnipRun<CR>", { desc = "Run current line" })
			vim.keymap.set("v", "<leader>cr", ":'<,'>SnipRun<CR>", { desc = "Run selection" })
			vim.keymap.set("n", "<leader>cc", ":SnipClose<CR>", { desc = "Close SnipRun output" })
		end,
	},
}
