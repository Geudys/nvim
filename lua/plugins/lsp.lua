return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap.set
				local extend = vim.tbl_extend

				local function map(mode, lhs, rhs, desc)
					keymap(mode, lhs, rhs, extend("force", opts, { desc = desc }))
				end

				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "LSP: Go to definition")
				map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "LSP: Go to implementation")
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "LSP: Go to type definition")
				map("n", "gr", "<cmd>Telescope lsp_references<CR>", "LSP: Show references")

				map("n", "K", vim.lsp.buf.hover, "LSP: Hover documentation")
				map("n", "gK", vim.lsp.buf.signature_help, "LSP: Signature help")
				map("i", "<C-k>", vim.lsp.buf.signature_help, "LSP: Signature help")

				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
				map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")

				map("n", "<leader>dd", vim.diagnostic.open_float, "Diagnostics: Line diagnostics")
				map("n", "<leader>db", "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnostics: Buffer diagnostics")
				map("n", "<leader>dw", "<cmd>Telescope diagnostics<CR>", "Diagnostics: Workspace diagnostics")

				map("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, "Diagnostics: Previous diagnostic")

				map("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, "Diagnostics: Next diagnostic")

				map("n", "[e", function()
					vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = true })
				end, "Diagnostics: Previous error")

				map("n", "]e", function()
					vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = true })
				end, "Diagnostics: Next error")

				map("n", "[w", function()
					vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN, float = true })
				end, "Diagnostics: Previous warning")

				map("n", "]w", function()
					vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = true })
				end, "Diagnostics: Next warning")
			end,
		})
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "●",
				severity = { min = vim.diagnostic.severity.HINT },
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			float = {
				source = true,
				border = "rounded",
			},
			update_in_insert = false,
			severity_sort = true,
			underline = true,
		})

		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
		})

		vim.lsp.config("markdown_oxide", {
			capabilities = capabilities,
			filetypes = { "markdown", "markdown_inline" },
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
					workspace = {
						checkThirdParty = false,
						library = { vim.env.VIMRUNTIME },
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("pyright", {
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "basic",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
					},
				},
			},
		})

		vim.lsp.config("eslint", {
			capabilities = capabilities,
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
					cargo = {
						allFeatures = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		})
	end,
}
