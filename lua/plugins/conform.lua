return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- se carga cuando guardas archivos
		cmd = { "ConformInfo" }, -- puedes abrir info con :ConformInfo
		keys = {
			{
				"<leader>mp",
				function()
					require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 3000 })
				end,
				desc = "Formatear código",
				mode = { "n", "v" },
			},
			{
				"<leader>mf",
				function()
					local formatters = require("conform").list_formatters()
					if #formatters == 0 then
						vim.notify("No hay formateadores disponibles para este tipo de archivo", vim.log.levels.WARN)
					else
						local names = {}
						for _, formatter in ipairs(formatters) do
							table.insert(names, formatter.name)
						end
						vim.notify("Formateadores disponibles: " .. table.concat(names, ", "), vim.log.levels.INFO)
					end
				end,
				desc = "Listar formateadores disponibles",
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
					less = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					vue = { "prettier" },
					svelte = { "prettier" },
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
							"--tab-width=4",
							"--use-tabs=false",
							"--single-quote=true",
							"--trailing-comma=es5",
							"--semi=true",
							"--bracket-spacing=true",
							"--arrow-parens=avoid",
						},
					},
					prettierd = {
						prepend_args = {
							"--tab-width=4",
							"--use-tabs=false",
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

			-- Autocmd para formateo automático al guardar
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf, lsp_fallback = true, timeout_ms = 3000 })
				end,
			})
		end,
	},
}
