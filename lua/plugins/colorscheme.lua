return {
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- se carga inmediatamente al inicio
		priority = 1000, -- asegurar que se aplica antes que otros colores
		config = function()
			local night_owl_config = {
				bold = true,
				italic = true,
				underline = true,
				undercurl = true,
				transparent = false, -- puedes cambiar rápido el valor inicial

				integrations = {
					alpha = true,
					cmp = true,
					dap = true,
					fidget = true,
					gitsigns = true,
					lualine = true,
					mason = true,
					noice = true,
					notify = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
					which_key = true,
				},

				styles = {
					comments = { italic = true },
					functions = { bold = true },
					keywords = { italic = true },
					booleans = { bold = true },
					types = { bold = true },
				},

				custom_highlights = function(colors)
					return {
						CursorLine = { bg = colors.bg_highlight },
						LineNr = { fg = colors.comment },
						CursorLineNr = { fg = colors.orange, bold = true },
						Search = { bg = colors.yellow, fg = colors.black },
						IncSearch = { bg = colors.orange, fg = colors.black },
						Visual = { bg = colors.bg_visual },
						DiagnosticError = { fg = colors.red },
						DiagnosticWarn = { fg = colors.yellow },
						DiagnosticInfo = { fg = colors.blue },
						DiagnosticHint = { fg = colors.teal },
					}
				end,
			}

			local ok, night_owl = pcall(require, "night-owl")
			if ok then
				night_owl.setup(night_owl_config)
				vim.cmd([[colorscheme night-owl]])
			else
				vim.notify("Night Owl plugin no encontrado", vim.log.levels.WARN)
			end

			-- Autocmds para enlaces de highlights
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "night-owl",
				callback = function()
					vim.cmd([[
						hi! link TelescopeSelection CursorLine
						hi! link NvimTreeFolderIcon Directory
						hi! link GitSignsAdd DiffAdd
						hi! link GitSignsChange DiffChange
						hi! link GitSignsDelete DiffDelete
					]])
				end,
			})
		end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "moon", -- main, moon, dawn
	-- 			dark_variant = "main",
	-- 			bold_vert_split = false,
	-- 			dim_nc_background = false,
	-- 			disable_background = true, -- fondo general transparente
	-- 			disable_float_background = true,
	-- 			disable_italics = false,
	--
	-- 			highlight_groups = {
	-- 				-- Bufferline sin fondo en ningún estado
	-- 				BufferLineFill = { bg = "none" },
	-- 				BufferLineBackground = { fg = "subtle", bg = "none" },
	-- 				BufferLineBufferSelected = { fg = "text", bg = "none", bold = true },
	-- 				BufferLineBufferVisible = { fg = "text", bg = "none" },
	--
	-- 				BufferLineSeparator = { fg = "overlay", bg = "none" },
	-- 				BufferLineSeparatorSelected = { fg = "overlay", bg = "none" },
	--
	-- 				BufferLineModified = { fg = "love", bg = "none" },
	-- 				BufferLineModifiedSelected = { fg = "love", bg = "none" },
	-- 				BufferLineModifiedVisible = { fg = "love", bg = "none" },
	-- 			},
	-- 		})
	--
	-- 		-- aplicar esquema
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
}
