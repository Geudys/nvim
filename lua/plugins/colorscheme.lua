return {
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function() end,
	},

	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local night_owl = require("night-owl")
			night_owl.setup({
				bold = true,
				italics = true,
				underline = true,
				undercurl = true,
				transparent_background = true,
			})
			vim.cmd("colorscheme night-owl")
		end,
	},
}
