return {
	{
		"stevearc/conform.nvim",
		lazy = false,
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
					typst = { "typstyle" },
					nix = { "nixfmt" },
				},
				formatters = {
					prettier = {
						prepend_args = {
							"--use-tabs",
							"--tab-width=8",
						},
					},
					stylua = {
						prepend_args = { "--indent-type", "Tabs" },
					},
				},
				default_format_opts = { lsp_fallback = true },
				format_on_save = { timeout_ms = 3000, lsp_fallback = true },
			})
		end,
	},
}
