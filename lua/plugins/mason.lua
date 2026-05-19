return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		event = "VeryLazy",
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
		lazy = true,
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"emmet_ls",
					"lua_ls",
					"ts_ls",
					"vimls",
					"bashls",
					"fish_lsp",
					"markdown_oxide",
					"tinymist",
					"nil_ls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"prettierd",
					"stylua",
					"shellcheck",
					"markdownlint",
					"yamlfmt",
					"nixfmt",
				},
				run_on_start = true,
				auto_update = true,
			})
		end,
	},
}
