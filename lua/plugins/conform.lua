return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>mp",
				function()
					require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 3000 })
				end,
				desc = "Formatear código",
				mode = { "n", "v" },
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt" },
					rust = { "rustfmt" },
					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					markdown = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
					yaml = { "prettier" },
					yml = { "prettier" },
					python = { "black", "isort" },
				},
				formatters = {
					prettier = {
						prepend_args = {
							"--tab-width=8",
							"--use-tabs=true",
							"--single-quote=true",
							"--trailing-comma=es5",
							"--semi=true",
							"--bracket-spacing=true",
							"--arrow-parens=avoid",
						},
					},
				},
				default_format_opts = { lsp_fallback = true },
				format_on_save = { timeout_ms = 3000, lsp_fallback = true },
			})
		end,
	},
}
