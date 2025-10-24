return {
	{
		"folke/flash.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("flash").setup({
				search = { case_sensitive = false, smart_case = false, incremental = false },
			})
			vim.keymap.set({ "n", "x", "o" }, "s", function()
				require("flash").jump()
			end, { desc = "Flash search" })
		end,
	},

	{
		"numToStr/Comment.nvim",
		lazy = true,
		keys = { { "gc", mode = "v" } },
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({ check_ts = true, enable_check_bracket_line = false })

			local cmp = require("cmp")
			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},

	{
		"folke/which-key.nvim",
		lazy = true,
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
				layout = {
					align = "right",
					spacing = 3,
				},
			})
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		event = "VeryLazy",
		config = function()
			require("colorizer").setup({ "*", css = { rgb_fn = true } })
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
					FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
					PERF = { icon = " ", alt = { "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				},
			})
		end,
	},

	{
		"kylechui/nvim-surround",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					normal = "<leader>ns",
					normal_cur = "<leader>nl",
					normal_line = "<leader>nS",
					delete = "<leader>nd",
					change = "<leader>nc",
					visual = "<leader>nt",
				},
			})
		end,
	},
	{
		"kaarmu/typst.vim",
		event = "VeryLazy",
		ft = "typst",
	},
}
