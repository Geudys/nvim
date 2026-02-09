vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars:append({ eob = " " })
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.spell = true
vim.opt.spelllang = "es,en"
vim.opt.breakindent = true
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.expandtab = false

vim.opt.swapfile = false
vim.opt.backup = false

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.isfname:append("@-@")
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.treesitter.start()
	end,
})
