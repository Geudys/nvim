return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		ft = "markdown",
		opts = {
			render_modes = { "n", "v", "i", "c" },
			checkbox = {
				unchecked = { icon = " " },
				checked = { icon = " " },
				custom = {
					info = {
						raw = "[>]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
					},
					warn = {
						raw = "[!]",
						rendered = " ",
						highlight = "RenderMarkdownWarn",
					},
					error = {
						raw = "[~]",
						rendered = " ",
						highlight = "RenderMarkdownError",
					},
				},
			},
			heading = {
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
			},
			html = { enabled = true },
			latex = { enabled = true },
			yaml = { enabled = true },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)

			vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#c1c1c1", fg = "#000000" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#aaaaaa", fg = "#000000" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#999999", fg = "#000000" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#888888", fg = "#000000" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#7799bb", fg = "#000000" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#6987a5", fg = "#000000" })

			vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#000000", bg = "#c1c1c1" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#000000", bg = "#aaaaaa" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#000000", bg = "#999999" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#000000", bg = "#888888" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#000000", bg = "#7799bb" })
			vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#000000", bg = "#6987a5" })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		ft = "markdown",
		keys = {
			{
				"<leader>oP",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		init = function()
			vim.g.mkdp_page_title = "${name}"
		end,
	},
	{
		"tjdevries/present.nvim",
		config = function()
			vim.keymap.set("n", "<leader>op", "<cmd>PresentStart<CR>", { desc = "Present Start" })
		end,
	},
}
