return {

	{
		"folke/which-key.nvim",
		event = false,
		opts = {
			preset = "helix",
			win = {
				border = "rounded",
				padding = { 0.5, 1 },
			},
		},
	},

	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		event = "VeryLazy",
		config = function()
			require("transparent").setup({
				enable = true,
				extra_groups = {
					"Alpha",
					"NormalFloat",
					"NvimTreeNormal",
					"BufferLineTabClose",
					"TelescopeBorder",
					"TelescopePrompt",
					"TelescopeResults",
					"TelescopeNormal",
					"LualineNormal",
					"Lualine",
					"lualine",
					"Barbecue",
					"WhichKeyFloat",
					"Pmenu",
					"NotifyBackground",
					"NoicePopup",
					"NeoTreeNormal",
					"DashboardHeader",
					"DashboardCenter",
					"DashboardFooter",
					"Bufferline",
					"NormalFloat",
					"FloatBorder",
				},
			})
			vim.cmd("TransparentEnable")
		end,
	},

	{
		"rcarriga/nvim-notify",
		lazy = true,
		event = "VeryLazy",
		config = function()
			local notify = require("notify")
			notify.setup({ background_colour = "#000001", timeout = 200 })
			vim.notify = notify
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup({
				"*",
			}, {
				RGB = true,
				RRGGBB = true,
				names = true,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background",
			})
		end,
	},
}
