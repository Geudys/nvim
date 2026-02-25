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
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			delay = 250,
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

	{
		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "1.*",
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			signs = true,
			sign_priority = 8,

			keywords = {
				FIXME = { icon = "", color = "error", alt = { "BUG", "FIX", "BROKEN" } },
				SECURITY = { icon = "󰒃", color = "error" },
				TODO = { icon = "", color = "warning" },
				HACK = { icon = "", color = "warning" },
				OPTIMIZE = { icon = "󰓅", color = "warning", alt = { "PERF", "PERFORMANCE" } },
				NOTE = { icon = "󰍨", color = "info", alt = { "INFO" } },
				REVIEW = { icon = "󰆈", color = "hint" },
				DEPRECATED = { icon = "󰂭", color = "warning" },
				REFACTOR = { icon = "󰑓", color = "hint" },
			},
			vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "TODO comments" }),
			vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble win.position=left<CR>", { desc = "TODO comments" }),
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				vim.keymap.set("n", "<leader>R", "<cmd>GrugFar<CR>", { desc = "Grug Far" }),
			})
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
