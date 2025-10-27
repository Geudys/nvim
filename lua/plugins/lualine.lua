return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "UIEnter",
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				theme = "auto",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = " ", right = "" }, icon = "" },
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
					},
					"filename",
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = true,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
						update_in_insert = true,
					},
				},
				lualine_y = {
					function()
						local clients = vim.lsp.get_clients()
						if next(clients) == nil then
							return ""
						end
						local names = {}
						for _, c in pairs(clients) do
							table.insert(names, c.name)
						end
						return " " .. table.concat(names, "|")
					end,
				},
				lualine_z = {
					{
						"location",
						separator = { left = "", right = " " },
						icon = "",
						padding = { left = 1, right = 0 },
					},
				},
			},
		})
	end,
}
