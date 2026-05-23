return {
	{
		"akinsho/bufferline.nvim",
		version = "*",

		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					mode = "buffers",

					numbers = "ordinal",

					diagnostics = "nvim_lsp",

					indicator = {
						icon = " ",
						style = "icon",
					},

					show_buffer_close_icons = false,
					show_close_icon = false,
					always_show_bufferline = true,
				},

				highlights = {
					fill = {
						bg = "NONE",
					},

					background = {
						bg = "NONE",
					},

					buffer_visible = {
						bg = "NONE",
					},

					buffer_selected = {
						bg = "NONE",
						bold = true,
						italic = false,
					},

					separator = {
						fg = "NONE",
						bg = "NONE",
					},

					separator_visible = {
						fg = "NONE",
						bg = "NONE",
					},

					separator_selected = {
						fg = "NONE",
						bg = "NONE",
					},

					close_button = {
						bg = "NONE",
					},

					close_button_visible = {
						bg = "NONE",
					},

					close_button_selected = {
						bg = "NONE",
					},

					tab = {
						bg = "NONE",
					},

					tab_selected = {
						bg = "NONE",
					},

					tab_close = {
						bg = "NONE",
					},
				},
			})

			vim.api.nvim_set_hl(0, "BufferLineFill", {
				bg = "NONE",
			})

			vim.api.nvim_set_hl(0, "TabLine", {
				bg = "NONE",
			})

			vim.api.nvim_set_hl(0, "TabLineFill", {
				bg = "NONE",
			})

			vim.api.nvim_set_hl(0, "TabLineSel", {
				bg = "NONE",
			})

			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, function()
					vim.cmd("BufferLineGoToBuffer " .. i)
				end, {
					desc = "Ir al buffer " .. i,
				})
			end

			vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", {
				desc = "Siguiente buffer",
			})

			vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", {
				desc = "Buffer anterior",
			})
		end,
	},
}
