return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                pickers = {
                    find_files = {
                        hidden = true,
                        no_ignore = true,
                        no_ignore_parent = true,
                    },
                },
            })

            vim.keymap.set("n", "<leader><leader>", builtin.find_files)
            vim.keymap.set("n", "<leader>tf", builtin.find_files)
            vim.keymap.set("n", "<leader>ti", "<cmd>Telescope live_grep<CR>")
            vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<CR>")
            vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<CR>")
            vim.keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<CR>")
            vim.keymap.set("n", "<leader>tc", "<cmd>Telescope grep_string<CR>")
            vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<CR>")
            vim.keymap.set("n", "<leader>tl", "<cmd>Telescope lazy<CR>")
            vim.keymap.set("n", "<leader>tgc", "<cmd>Telescope git_commits<CR>")
            vim.keymap.set("n", "<leader>tgf", "<cmd>Telescope git_files<CR>")
            vim.keymap.set("n", "<leader>tgb", "<cmd>Telescope git_branches<CR>")
            vim.keymap.set("n", "<leader>tgs", "<cmd>Telescope git_status<CR>")
            vim.keymap.set("n", "<leader>tld", "<cmd>lsp_definitions<CR>")
            vim.keymap.set("n", "<leader>tlr", "<cmd>lsp_references<CR>")
            vim.keymap.set("n", "<leader>tli", "<cmd>lsp_implementations<CR>")
            vim.keymap.set("n", "<leader>tlt", "<cmd>lsp_type_definitions<CR>")
            vim.keymap.set("n", "<leader>tls", "<cmd>lsp_document_symbols<CR>")
            vim.keymap.set("n", "<leader>tlS", "<cmd>lsp_workspace_symbols<CR>")
            vim.keymap.set("n", "<leader>tlD", "<cmd>lsp_dynamic_workspace_symbols<CR>")
        end,
    },
}
