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
		"mbbill/undotree",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.undotree_WindowLayout = 3

			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
		end,
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
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})

			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>e",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
		},
	},

	{
		"echasnovski/mini.comment",
		version = false,
		lazy = true,
		keys = { { "gc", mode = { "v" } }, { "gcc", mode = "n" } },
		config = function()
			require("mini.comment").setup({
				options = {
					custom_commentstring = nil,
				},
			})
		end,
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
		lazy = true,
		event = "VeryLazy",
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "<leader>aa",
				delete = "<leader>ad",
				find = "<leader>af",
				find_left = "<leader>aF",
				highlight = "<leader>ah",
				replace = "<leader>ar",
				update_n_lines = "<leader>an",

				suffix_last = "l",
				suffix_next = "n",
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},
}
