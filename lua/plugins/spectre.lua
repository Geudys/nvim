return {
	{
		"nvim-pack/nvim-spectre",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local spectre = require("spectre")

			spectre.setup({
				color_devicons = true,
				highlight = {
					ui = "String",
					search = "DiffChange",
					replace = "DiffDelete",
				},
				mapping = {
					toggle_line = {
						map = "dd",
						cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
						desc = "Activar/Desactivar línea",
					},
					enter_file = {
						map = "<cr>",
						cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
						desc = "Entrar archivo",
					},
					send_to_qf = {
						map = "Q",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "Enviar a Quickfix",
					},
					replace_cmd = {
						map = "c",
						cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
						desc = "Reemplazar",
					},
					show_option_menu = {
						map = "o",
						cmd = "<cmd>lua require('spectre').show_options()<CR>",
						desc = "Opciones",
					},
					run_replace = {
						map = "<leader>R",
						cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
						desc = "Ejecutar reemplazo global",
					},
					close_spectre = {
						map = "q",
						cmd = "<cmd>lua require('spectre').close()<CR>",
						desc = "Cerrar Spectre",
					},
					refresh = {
						map = "r",
						cmd = "<cmd>lua require('spectre').refresh()<CR>",
						desc = "Refrescar resultados",
					},
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>ssr", function()
				spectre.toggle()
			end, { desc = "Abrir/Cerrar Spectre (Buscar/Reemplazar)" })
			vim.keymap.set("n", "<leader>ssw", function()
				spectre.open_visual({ select_word = true })
			end, { desc = "Buscar palabra bajo cursor (Spectre)" })
			vim.keymap.set("n", "<leader>ssf", function()
				spectre.open_file_search({ select_word = true })
			end, { desc = "Buscar en archivo actual (Spectre)" })
			vim.keymap.set("n", "<leader>ssq", function()
				spectre.close()
			end, { desc = "Cerrar Spectre" })
		end,
	},
}
