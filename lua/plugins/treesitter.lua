return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")

			local ensure_installed = {
				"javascript",
				"typescript",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"typst",
				"regex",
				"fish",
				"diff",
				"nix",
			}

			treesitter.install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					local buf = args.buf
					local ft = vim.bo[buf].filetype

					local lang = vim.treesitter.language.get_lang(ft)
					if not lang then
						return
					end

					local ok_add = pcall(vim.treesitter.language.add, lang)
					if not ok_add then
						return
					end

					pcall(vim.treesitter.start, buf, lang)
				end,
			})
		end,
	},
}
