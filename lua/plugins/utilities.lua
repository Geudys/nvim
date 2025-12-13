return {
	{
		"folke/flash.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("flash").setup({
				search = { case_sensitive = false, smart_case = false, incremental = false },
			})
			vim.keymap.set({ "n", "x", "o" }, "z", function()
				require("flash").jump()
			end, { desc = "Flash search" })
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		lazy = true,
		keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = "n" } },
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.icons",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",

				suffix_last = "l",
				suffix_next = "n",
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
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
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
				css = { rgb_fn = true },
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
		"folke/todo-comments.nvim",
		lazy = false,
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				signs = true,
				keywords = {
					FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
					PERF = { icon = " ", alt = { "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				},
			})
		end,
	},
	{
		"kaarmu/typst.vim",
		event = "VeryLazy",
		ft = "typst",
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}
