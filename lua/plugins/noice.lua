return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
					format = {
						cmdline = { pattern = "^:", icon = ":", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
						search_up = { kind = "search", pattern = "^?", icon = "?", lang = "regex" },
					},
				},
				views = {
					cmdline_popup = {
						position = { row = 2, col = "50%" },
						size = { width = "30%", height = "auto" },
						border = { style = "rounded" },
						win_options = { winblend = 10 },
					},
					popupmenu = {
						relative = "editor",
						position = { row = 5, col = "50%" },
						size = { width = "30%", height = "auto" },
						border = { style = "rounded" },
						win_options = { winblend = 10 },
					},
				},
				messages = {
					enabled = true,
					view = "notify",
					view_error = "notify",
					view_warn = "notify",
					view_history = "messages",
					view_search = "virtualtext",
				},
				popupmenu = { enabled = true, backend = "nui" },
				commands = {
					history = {
						view = "split",
						opts = { enter = true, format = "details" },
						filter = {
							any = {
								{ event = "msg_show", kind = { "", "echo", "echomsg" } },
								{ event = "msg_history_show" },
							},
						},
					},
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = { enabled = true, silent = true },
					signature = { enabled = true },
				},
				notify = { enabled = true, view = "notify" },
				routes = {
					{ filter = { event = "msg_show", min_height = 10 }, view = "split" },
				},
			})
		end,
	},
}
