-- lua/plugins/vim-options.lua

-- ========================
-- Apariencia y UI
-- ========================
vim.opt.number = true -- Mostrar número de línea actual
vim.opt.relativenumber = true -- Mostrar números relativos
vim.opt.signcolumn = "yes" -- Siempre mostrar columna de signos
vim.opt.fillchars:append({ eob = " " }) -- Ocultar '~' al final del buffer
vim.opt.wrap = true -- No ajustar líneas automáticamente
vim.opt.linebreak = true -- No cortar palabras
vim.opt.scrolloff = 20 -- Mantener margen vertical
vim.opt.sidescrolloff = 20 -- Margen horizontal
vim.opt.cursorline = true -- Resaltar línea actual
vim.opt.splitbelow = true -- Splits horizontales abajo
vim.opt.splitright = true -- Splits verticales a la derecha

-- ========================
-- Tabs y sangría
-- ========================
vim.opt.tabstop = 4 -- Número de espacios por tab
vim.opt.softtabstop = 4 -- Espacios al usar <Tab> en insert
vim.opt.shiftwidth = 4 -- Espacios al autoindentar
vim.opt.expandtab = true -- Usar espacios en lugar de tabs
vim.opt.smartindent = true -- Sangría inteligente

-- ========================
-- Archivos y backups
-- ========================
vim.opt.swapfile = false -- Desactivar swap
vim.opt.backup = false -- Desactivar backup

-- Crear directorio para undo si no existe
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true -- Historial persistente de undo

-- ========================
-- Otros
-- ========================
vim.opt.isfname:append("@-@") -- Permitir '@' en nombres de archivos
vim.opt.encoding = "utf-8" -- Codificación
vim.opt.mouse = "a" -- Habilitar mouse

-- ========================
-- Tema
-- ========================
pcall(vim.cmd.colorscheme, "night-owl")

-- ========================
-- Búsqueda
-- ========================
vim.opt.ignorecase = true -- Ignorar mayúsculas/minúsculas
vim.opt.smartcase = true -- Sensible si usas mayúsculas
vim.opt.hlsearch = true -- Resaltar coincidencias
vim.opt.incsearch = true -- Búsqueda incremental
