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
			})

			vim.keymap.set("n", "<leader>fs", function()
				spectre.toggle()
			end, { desc = "Abrir/Cerrar Spectre (Buscar/Reemplazar)" })
			vim.keymap.set("n", "<leader>fw", function()
				spectre.open_visual({ select_word = true })
			end, { desc = "Buscar palabra bajo cursor (Spectre)" })
			vim.keymap.set("n", "<leader>ff", function()
				spectre.open_file_search({ select_word = true })
			end, { desc = "Buscar en archivo actual (Spectre)" })
			vim.keymap.set("n", "<leader>fq", function()
				spectre.close()
			end, { desc = "Cerrar Spectre" })
		end,
	},
}
