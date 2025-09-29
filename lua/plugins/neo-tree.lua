return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_in_last_window = true,
			sort_case_insensitive = true,
			sort_function = nil,
			default_component_configs = {
				container = { enable_character_fade = true },
				indent = { indent_size = 2, padding = 1 },
				name = { trailing_slash = false, use_git_status_colors = true },
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "",
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
			},
			window = {
				position = "left",
				width = 35,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<space>"] = "none",
					["o"] = "open",
					["<cr>"] = "open",
					["s"] = "open_split",
					["v"] = "open_vsplit",
					["t"] = "open_tabnew",
					["a"] = "add",
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["c"] = "copy",
					["m"] = "move",
					["q"] = "close_window",
				},
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = true,
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
			buffers = {
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = true,
				show_unloaded = true,
			},
			git_status = {
				window = { position = "float" },
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
		vim.keymap.set("n", "<leader>E", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })
		vim.keymap.set("n", "<leader>ge", ":Neotree git_status<CR>", { desc = "Git status en Neo-tree" })
		vim.keymap.set("n", "<leader>be", ":Neotree buffers<CR>", { desc = "Buffers en Neo-tree" })
	end,
}
