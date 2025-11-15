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
                    "pyright",
                    "eslint",
                    "lua_ls",
                    "rust_analyzer",
                    "ts_ls",
                    "html",
                    "cssls",
                    "jsonls",
                    "vimls",
                    "bashls",
                    "fish_lsp",
                    "markdown_oxide",
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
                    "isort",
                    "black",
                    "pylint",
                    "eslint_d",
                },
                run_on_start = true,
                auto_update = true,
            })
        end,
    },
}
