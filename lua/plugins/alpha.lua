return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Cabecera personalizada
			dashboard.section.header.val = {
				[[                                                                      ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			}

			-- Botones del dashboard
			dashboard.section.buttons.val = {
				dashboard.button("e", "  Neotre", ":Neotree<CR>"),
				dashboard.button("f", "  Search files", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recents", ":Telescope oldfiles<CR>"),
				dashboard.button("h", "  Check health", ":checkhealth<CR>"),
				dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
				dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
				dashboard.button("q", "  Exit", ":qa<CR>"),
			}

			-- Footer personalizado
			dashboard.section.footer.val = function()
				return "󰈹 Firefox ~ 󱓧 Obsidian ~  Wezterm"
			end

			dashboard.opts.opts.noautocmd = true
			alpha.setup(dashboard.config)
		end,
	},
}
