return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "ordinal", -- muestra número de buffer para fácil navegación
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					indicator = { icon = "▎", style = "icon" },
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					max_name_length = 30,
					tab_size = 21,
					diagnostics = "nvim_lsp",
					offsets = {
						{ filetype = "neo-tree", text = "Neo-tree", text_align = "left", separator = true },
						{ filetype = "Outline", text = "Symbols Outline", text_align = "left", separator = true },
					},
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thin", -- estilo más llamativo
					enforce_regular_tabs = true,
					always_show_bufferline = true,
					sort_by = "id",
				},
			})
		end,
	},
}
