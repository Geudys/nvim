return {
	{
		"nvim-neotest/neotest",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-go",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local neotest = require("neotest")

			neotest.setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "jest.config.js",
						env = { CI = true },
					}),
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
					require("neotest-go"),
				},
			})

			vim.keymap.set("n", "<Leader>ctt", function()
				neotest.run.run()
			end, { desc = "Run nearest test" })

			vim.keymap.set("n", "<Leader>ctf", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run tests in file" })

			vim.keymap.set("n", "<Leader>cts", function()
				neotest.summary.toggle()
			end, { desc = "Toggle test summary" })

			vim.keymap.set("n", "<Leader>cto", function()
				neotest.output.open({ enter = true })
			end, { desc = "Show test output" })

			vim.keymap.set("n", "<Leader>ctd", function()
				neotest.run.run({ strategy = "dap" })
			end, { desc = "Debug test with DAP" })
		end,
	},
	{
		"michaelb/sniprun",
		build = "bash ./install.sh",
		config = function()
			require("sniprun").setup({
				selected_interpreters = { "JS_TS_original" },
				display = { "VirtualTextOk", "Terminal" },
			})

			vim.keymap.set("n", "<leader>cr", ":SnipRun<CR>", { desc = "Run current line" })
			vim.keymap.set("v", "<leader>cr", ":'<,'>SnipRun<CR>", { desc = "Run selection" })
			vim.keymap.set("n", "<leader>cc", ":SnipClose<CR>", { desc = "Close SnipRun output" })
		end,
	},
}
