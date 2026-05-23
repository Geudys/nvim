return {
	{
		"vague-theme/vague.nvim",
		lazy = true,
		priority = 1000,
		config = function() end,
	},

	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		config = function()
			local rose = require("rose-pine")
			rose.setup({
				bold = true,
				italics = true,
				underline = true,
				undercurl = true,
				transparent_background = true,
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},

	{
		"oxfist/night-owl.nvim",
		lazy = true,
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
		end,
	},
	-- Using lazy.nvim
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				-----MAIN OPTIONS-----
				--
				-- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
				theme = "immortal",
				-- Can be one of: 'light' | 'dark', or set via vim.o.background
				variant = "dark",
				-- Use an alternate, lighter bg
				alt_bg = true,
				-- If true, docstrings will be highlighted like strings, otherwise they will be
				-- highlighted like comments. Note, behavior is dependent on the language server.
				colored_docstrings = true,
				-- If true, highlights the {sign,fold} column the same as cursorline
				cursorline_gutter = true,
				-- If true, highlights the gutter darker than the bg
				dark_gutter = true,
				-- if true favor treesitter highlights over semantic highlights
				favor_treesitter_hl = true,
				-- Don't set background of floating windows. Recommended for when using floating
				-- windows with borders.
				plain_float = true,
				-- Show the end-of-buffer character
				show_eob = false,
				-- If true, enable the vim terminal colors
				term_colors = true,
				-- Keymap (in normal mode) to toggle between light and dark variants.
				toggle_variant_key = nil,
				-- Don't set background
				transparent = false,

				-----DIAGNOSTICS and CODE STYLE-----
				--
				diagnostics = {
					darker = true, -- Darker colors for diagnostic
					undercurl = true, -- Use undercurl for diagnostics
					background = false, -- Use background color for virtual text
				},
				-- The following table accepts values the same as the `gui` option for normal
				-- highlights. For example, `bold`, `italic`, `underline`, `none`.
				code_style = {
					comments = "italic",
					conditionals = "italic",
					functions = "bold",
					keywords = "italic",
					headings = "bold", -- Markdown headings
					operators = "none",
					keyword_return = "italic",
					strings = "none",
					variables = "none",
				},

				-----PLUGINS-----
				--
				-- The following options allow for more control over some plugin appearances.
				plugin = {
					lualine = {
						-- Bold lualine_a sections
						bold = true,
						-- Don't set section/component backgrounds. Recommended to not set
						-- section/component separators.
						plain = false,
					},
					cmp = { -- works for nvim.cmp and blink.nvim
						-- Don't highlight lsp-kind items. Only the current selection will be highlighted.
						plain = false,
						-- Reverse lsp-kind items' highlights in blink/cmp menu.
						reverse = true,
					},
				},

				-- CUSTOM HIGHLIGHTS --
				--
				-- Override default colors
				colors = {},
				-- Override highlight groups
				highlights = {},
			})
			-- Convenience function that simply calls `:colorscheme <theme>` with the theme
			-- specified in your config.
			require("black-metal").load()
		end,
	},
}
