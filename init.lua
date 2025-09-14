-- ========================================
-- Configuración Global
-- ========================================

-- Tecla líder
vim.g.mapleader = " "

-- Soporte para colores en terminal
vim.opt.termguicolors = true

-- ========================================
-- Instalar Lazy automáticamente si no está
-- ========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- última versión estable
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ========================================
-- Cargar Plugins con Lazy
-- ========================================
require("lazy").setup("plugins")

-- ========================================
-- Opciones y Atajos
-- ========================================
require("core.options") -- Opciones generales de Neovim
require("core.keymaps") -- Atajos personalizados
