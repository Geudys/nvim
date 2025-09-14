return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"emmet_ls",
					"pyright",
					"eslint",
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"html",
					"cssls",
					"intelephense",
					"jdtls",
					"jsonls",
					"yamlls",
					"bashls",
					"dockerls",
					"sqlls",
					"vimls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"prettierd",
					"stylua",
					"isort",
					"black",
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
}
