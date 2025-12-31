return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "ordinal",
					indicator = { icon = " ", style = "icon" },
					diagnostics = "nvim_lsp",
				},
			})
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, function()
					vim.cmd("BufferLineGoToBuffer " .. i)
				end, { desc = "Ir al buffer " .. i })
			end
		end,
	},
}
