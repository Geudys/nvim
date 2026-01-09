return {
	{
		"folke/flash.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("flash").setup({
				search = { case_sensitive = false, smart_case = false, incremental = false },
			})
			vim.keymap.set({ "n", "x", "o" }, "zz", function()
				require("flash").jump()
			end, { desc = "Flash search" })
		end,
	},
	{
		"folke/which-key.nvim",
		lazy = false,
		event = "VeryLazy",
		config = function()
			vim.o.ttimeout = true
			vim.o.ttimeoutlen = 101
			require("which-key").setup({
				preset = "classic",
				win = {
					border = "single",
					width = 40,
					height = 25,
					row = vim.o.lines - 18,
					col = vim.o.columns - 42,
				},
				layout = { align = "right", spacing = 3 },
			})
		end,
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
			notify.setup({ background_colour = "#000001", timeout = 500 })
			vim.notify = notify
		end,
	},
	{
		"mbbill/undotree",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.undotree_WindowLayout = 3

			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
		end,
	},
	{
		"kaarmu/typst.vim",
		event = "VeryLazy",
		ft = "typst",
	},
}
