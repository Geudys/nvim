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
			vim.cmd("TransparentDisable")
		end,
	},

	{
		"echasnovski/mini.notify",
		version = false,
		event = "VeryLazy",

		config = function()
			require("mini.notify").setup({
				lsp_progress = {
					enable = true,
					level = "INFO",
					duration_last = 1000,
				},
				window = {
					config = function()
						return {
							anchor = "NE",
							col = vim.o.columns,
							row = 0,
						}
					end,
				},
			})

			vim.notify = require("mini.notify").make_notify()
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
