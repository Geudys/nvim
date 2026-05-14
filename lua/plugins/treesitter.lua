return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		build = ":TSUpdate",
		config = function()
			local nvim_ts = require("nvim-treesitter")

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local buf = args.buf
					pcall(vim.treesitter.start, buf)
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			nvim_ts.setup({
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})

			local ensureInstalled = {
				"json", "javascript", "typescript", "tsx",
				"yaml", "html", "css", "markdown",
				"markdown_inline", "bash", "lua", "vim",
				"gitignore", "vimdoc", "c", "typst",
				"regex", "fish", "go", "rust",
				"python", "toml", "diff", "gitcommit", "query",
				"nix",
			}

			local ok, ts_config = pcall(require, "nvim-treesitter.config")
			if ok then
				local alreadyInstalled = ts_config.get_installed()
				local parsersToInstall = vim.iter(ensureInstalled)
				    :filter(function(parser)
					    return not vim.tbl_contains(alreadyInstalled, parser)
				    end)
				    :totable()

				if #parsersToInstall > 0 then
					nvim_ts.install(parsersToInstall)
				end
			end
		end,
	},
}
