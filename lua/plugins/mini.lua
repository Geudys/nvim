return {
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
}
