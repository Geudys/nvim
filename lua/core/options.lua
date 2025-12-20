vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.fillchars:append({ eob = " " })

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

vim.opt.scrolloff = 30
vim.opt.sidescrolloff = 5

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.spell = true
vim.opt.spelllang = { "es", "en" }

vim.opt.formatoptions:append("t")
vim.opt.formatoptions:remove({ "c", "r", "o" })

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

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

vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.hidden = true
vim.opt.confirm = true

pcall(vim.cmd.colorscheme, "night-owl")
