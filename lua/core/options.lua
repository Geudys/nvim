vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars:append({ eob = " " })
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.spell = true
vim.opt.spelllang = "es,en"
vim.opt.breakindent = true
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

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

pcall(vim.cmd.colorscheme, "night-owl")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
