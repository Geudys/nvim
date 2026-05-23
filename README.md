# Neovim Config

Personal **Neovim** configuration shaped and refined over time, now primarily focused on managing my _.dotfiles_ and my _NixOS_ environment. The workflow is especially optimized for _Markdown_ and _Typst_ editing, aiming for a minimal, fast, and comfortable experience for writing, configuration, and daily development.

## Structure

```
nvim/
├── init.lua
├── lua/
│   ├── core/       -> Options, keymaps, plugin manager, notes
│   └── plugins/    -> Plugin configurations
```

## Features

- Fully configured in Lua
- Plugin management with lazy.nvim
- LSP support via nvim-lspconfig and mason.nvim
- Autocompletion with nvim-cmp and LuaSnip snippets
- Treesitter for syntax highlighting
- Telescope for fuzzy finding and search
- Git integration with gitsigns and lazygit
- Code formatting with conform.nvim
- UI enhancements: noice.nvim, lualine, bufferline, which-key
- Markdown rendering and preview
- Obsidian note-taking integration with backlinks and tags
- Option for transparent backgrounds
- Multiple colorschemes available

## Requirements

- Neovim >= 0.12
- Git
- Lazygit (recommended)
- Node.js (for some LSP servers)
- Treesitter
- C/C++ compiler (for Treesitter parsers)

## Installation

```bash
git clone https://github.com/Geudys/nvim.git ~/.config/nvim
nvim
```

Plugins will install automatically on first launch.
