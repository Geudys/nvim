# 🚀 Neovim Config

My personal **Neovim configuration**, focused on normal development, performance optimization, and a modern terminal experience.  
Built with **Lua**, including **LSP** support, autocompletion, snippets, and more.

---

## 📂 Repository Structure

```
nvim/
├── init.lua
├── lua/
│ ├── core/ -> Neovim options and keymaps
│ └── plugins/ -> Plugins configurations
```

---

## ✨ Features

- ⚡ Fully configured in **Lua** for speed and flexibility.
- 🧩 Plugin management with **lazy.nvim**.
- 💡 **LSP** support with `nvim-lspconfig` and `mason`.
- 🔮 Autocompletion using `nvim-cmp` + snippets (`LuaSnip`).
- 🌲 **Treesitter** for modern syntax highlighting.
- 📊 UI improvements with `noice`, `lualine`, `bufferline`, and more.
- 🔍 Powerful search and navigation with `telescope` and `spectre`.
- 🌐 Git integration with `gitsigns` and related tools.
- 🧠 **Obsidian.nvim** integration for connected note-taking and Zettelkasten workflows.
- 🎨 Default theme: **Night Owl**.

---

## 🛠️ Requirements

- Neovim `>= 0.11`
- Git
- Lazygit (recommended for Git workflows)
- Node.js (required by some LSP servers)
- A C/C++ compiler (for Treesitter parsers and certain plugins)

---

## ⚙️ Installation

1. Clone this repository into your Neovim config path:

```bash
git clone https://github.com/Geudys/nvim.git
```

2. Open Neovim and let it install plugins automatically:

```bash
nvim
```

## 📝 Notes

his configuration is a work in progress.

Designed for general development (backend, frontend, scripting, etc.).

Inspired by minimal but powerful Neovim setups.
