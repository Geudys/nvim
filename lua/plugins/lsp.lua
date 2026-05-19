return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"nvim-mini/mini.completion",
			"nvim-mini/mini.cmdline",
			{ "nvim-mini/mini.snippets", dependencies = { "rafamadriz/friendly-snippets" } },
			"j-hui/fidget.nvim",
		},
		config = function()
			-- mini.cmdline
			require("mini.cmdline").setup({
				autocorrect = { enable = false },
			})

			-- mini.completion
			require("mini.completion").setup({
				lsp_completion = {
					auto_setup = true,
				},
			})

			-- mini.snippets
			local MiniSnippets = require("mini.snippets")
			MiniSnippets.setup({
				snippets = {
					MiniSnippets.gen_loader.from_lang(),
				},
			})
			MiniSnippets.start_lsp_server({ match = false })

			-- Tab / S-Tab mappings for completion and snippets
			vim.keymap.set('i', '<Tab>', function()
				if vim.fn.pumvisible() == 1 then
					return '<C-n>'
				end
				local can_expand = #MiniSnippets.expand({ insert = false }) > 0
				if can_expand then
					vim.schedule(MiniSnippets.expand)
					return ''
				end
				if MiniSnippets.session.get() ~= nil then
					MiniSnippets.session.jump('next')
					return ''
				end
				return '<Tab>'
			end, { expr = true, desc = 'Complete / Expand snippet' })

			vim.keymap.set('i', '<S-Tab>', function()
				if vim.fn.pumvisible() == 1 then
					return '<C-p>'
				end
				if MiniSnippets.session.get() ~= nil then
					MiniSnippets.session.jump('prev')
					return ''
				end
				return '<S-Tab>'
			end, { expr = true, desc = 'Prev completion / Prev snippet tabstop' })

			-- Native LSP capabilities via mini.completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

			vim.lsp.config("*", { capabilities = capabilities })

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

					map("n", "<leader>d", vim.diagnostic.open_float, "Diagnostics: Line diagnostics")
					map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnostics: Buffer diagnostics")

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

			vim.lsp.config("lua_ls", {
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

			vim.lsp.config("ts_ls", {
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

			vim.lsp.config("markdown_oxide", {
				filetypes = { "markdown", "markdown_inline" },
			})

			vim.lsp.config("nil_ls", {})

			vim.lsp.enable({
				"markdown_oxide",
				"lua_ls",
				"pyright",
				"eslint",
				"rust_analyzer",
				"ts_ls",
				"nil_ls",
			})
		end,
	},
}
