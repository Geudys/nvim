return {
	"romgrk/barbar.nvim",
	opts = {
		animation = true,
		clickable = false,
		auto_hide = false,
		maximum_padding = 1,
		minimum_padding = 1,
		icons = {
			separator_at_end = false,
			current = {
				separator = { left = "", right = "" },
				button = "",
				filetype = { custom_colors = true },
			},
			alternate = {
				separator = { left = "", right = "" },
				button = "",
				filetype = { custom_colors = true },
			},
			inactive = {
				separator = { left = "", right = "" },
				button = "",
				filetype = { custom_colors = true },
			},
			visible = {
				separator = { left = "", right = "" },
				button = "",
				filetype = { custom_colors = true },
			},
		},
	},
	config = function(_, opts)
		require("barbar").setup(opts)
		local bg = "#ffcb8b" -- tu color de fondo personalizado

		-- Aplica color de fondo a todos los grupos excepto los separadores
		local groups = {
			"BufferCurrent",
			"BufferCurrentIndex",
			"BufferCurrentMod",
			"BufferCurrentTarget",
			"BufferVisible",
			"BufferVisibleIndex",
			"BufferVisibleMod",
			"BufferVisibleTarget",
		}

		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = bg })
		end
		vim.api.nvim_set_hl(0, "BufferInactive", { bg = "#7e97ac" })
		vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = "#ffcb8b" })
	end,
}
