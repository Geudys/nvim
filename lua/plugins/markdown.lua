return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		ft = "markdown",
		opts = {
			render_modes = { "n", "v", "i", "c" },

			checkbox = {
				unchecked = { icon = " " },
				checked = { icon = " " },

				custom = {
					info = {
						raw = "[>]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
					},
					warn = {
						raw = "[!]",
						rendered = " ",
						highlight = "RenderMarkdownWarn",
					},
					error = {
						raw = "[~]",
						rendered = " ",
						highlight = "RenderMarkdownError",
					},
				},
			},

			html = { enabled = false },
			latex = { enabled = false },
			yaml = { enabled = false },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		ft = "markdown",
		keys = {
			{
				"<leader>op",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		init = function()
			vim.g.mkdp_page_title = "${name}"
		end,
	},
}
