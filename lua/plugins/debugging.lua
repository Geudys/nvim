return {
	-- Debug Adapter Protocol (DAP)
	{
		"mfussenegger/nvim-dap",
		-- lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio", -- 🔥 dependencia requerida por nvim-dap-ui
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- UI
			dapui.setup()

			-- Integrar dap-ui con eventos
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Mason DAP para instalar adaptadores
			require("mason-nvim-dap").setup({
				automatic_installation = true,
				handlers = {},
			})

			-- Keymaps básicos de depuración
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Start/Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })

			vim.keymap.set("n", "<Leader>cb", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>cB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "DAP: Conditional Breakpoint" })

			vim.keymap.set("n", "<Leader>cdr", dap.repl.open, { desc = "DAP: Open REPL" })
			vim.keymap.set("n", "<Leader>cdl", dap.run_last, { desc = "DAP: Run Last" })
			vim.keymap.set("n", "<Leader>cdu", dapui.toggle, { desc = "DAP: Toggle UI" })
		end,
	},
}
