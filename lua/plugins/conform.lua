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
					require("conform").format({
						async = true,
						lsp_fallback = true,
						timeout_ms = 3000,
					})
				end,
				desc = "Formatear archivo",
				mode = { "n", "v" },
			},
			{
				"<leader>mf",
				function()
					local conform = require("conform")
					local formatters = conform.list_formatters()
					if #formatters == 0 then
						vim.notify("No hay formateadores para este tipo de archivo", vim.log.levels.WARN)
						return
					end

					local names = vim.tbl_map(function(f)
						return f.name
					end, formatters)

					vim.notify("Formateadores activos: " .. table.concat(names, ", "), vim.log.levels.INFO)
				end,
				desc = "Listar formateadores",
			},
		},

		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt" },
					rust = { "rustfmt" },

					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },

					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },

					json = { "prettier" },
					jsonc = { "prettier" },
					yaml = { "prettier" },
					yml = { "prettier" },

					markdown = { "prettier" },

					python = { "isort", "black" },
				},

				formatters = {
					prettier = {
						prepend_args = {
							"--tab-width=4",
							"--use-tabs=false",

							"--prose-wrap=preserve",
							"--print-width=80",

							"--bracket-spacing=true",
						},
					},
				},

				format_on_save = function()
					return {
						timeout_ms = 3000,
						lsp_fallback = true,
					}
				end,

				default_format_opts = {
					lsp_fallback = true,
				},
			})
		end,
	},
}
