vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("i", "<C-H>", "<C-W>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>sd", "<C-w>q", { desc = "Cerrar Split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Balancear tamaños" })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Eliminar buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Cerrar otros buffers" })
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Cerrar todos los buffers" })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Nuevo buffer" })

vim.keymap.set("n", "<leader>h", function()
	vim.cmd.nohlsearch()
	vim.fn.setreg("/", "")
end, { desc = "Limpiar búsqueda" })

vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<C-x>", [[ggVG"_d]])
vim.keymap.set("n", "<C-c>", [[ggVG"_c]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copiar al sistema" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copiar línea al sistema" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Borrar sin copiar" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Pegar sin sobrescribir" })
vim.keymap.set("n", "<leader>P", [["+p]], { desc = "Pegar desde el sistema" })
