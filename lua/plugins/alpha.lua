return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

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

			dashboard.section.buttons.val = {
				dashboard.button("e", "  Neotre", ":Neotree<CR>"),
				dashboard.button("f", "  Search files", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recents", ":Telescope oldfiles<CR>"),
				dashboard.button("h", "  Check health", ":checkhealth<CR>"),
				dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
				dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
				dashboard.button("q", "  Exit", ":qa<CR>"),
			}

			dashboard.opts.opts.noautocmd = true
			alpha.setup(dashboard.config)
		end,
	},
}
