return {
	{
		"vim-test/vim-test",
		dependencies = {
			"tpope/vim-dispatch",
		},
		keys = {
			{ "<leader>Ts", "<cmd>TestSuite<cr>", desc = "Test Suite" },
			{ "<leader>Tf", "<cmd>TestFile<cr>", desc = "Test File" },
			{ "<leader>Tc", "<cmd>w|TestClass<cr>", desc = "Class" },
			{ "<leader>Tn", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
			{ "<leader>Tl", "<cmd>TestLast<cr>", desc = "Test Last" },
			{ "<leader>Tv", "<cmd>TestVisit<cr>", desc = "Test Visit" },
		},
		config = function()
			vim.g["test#strategy"] = "neovim"
			vim.g["test#neovim#term_position"] = "belowright"
			vim.g["test#neovim#preserve_screen"] = 1
			vim.g["test#python#runner"] = "pyunit" -- pytest
		end,
	},
	{
		"nvim-neotest/neotest",
		keys = {
			{
				"<leader>TNF",
				"<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
				desc = "Debug File",
			},
			{
				"<leader>TNL",
				"<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>",
				desc = "Debug Last",
			},
			{ "<leader>TNa", "<cmd>w|lua require('neotest').run.attach()<cr>", desc = "Attach" },
			{ "<leader>TNf", "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
			{ "<leader>TNl", "<cmd>w|lua require('neotest').run.run_last()<cr>", desc = "Last" },
			{ "<leader>TNn", "<cmd>w|lua require('neotest').run.run()<cr>", desc = "Nearest" },
			{ "<leader>TNN", "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
			{ "<leader>TNo", "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
			{ "<leader>TNs", "<cmd>w|lua require('neotest').run.stop()<cr>", desc = "Stop" },
			{ "<leader>TNS", "<cmd>w|lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
		},
		dependencies = {
			"vim-test/vim-test",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
		},
		config = function()
			vim.g["test#strategy"] = "dispatch"

			local opts = {
				adapters = {
					require("neotest-plenary"),
					require("neotest-vim-test")({
						ignore_file_types = { "python", "vim", "lua" },
					}),
				},
				-- overseer.nvim
				consumers = {
					overseer = require("neotest.consumers.overseer"),
				},
				overseer = {
					enabled = true,
					force_default = true,
				},
			}
			require("neotest").setup(opts)
		end,
	},
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>ToR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
			{ "<leader>Toa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
			{ "<leader>Tob", "<cmd>OverseerBuild<cr>", desc = "Build" },
			{ "<leader>Toc", "<cmd>OverseerClose<cr>", desc = "Close" },
			{ "<leader>Tod", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete Bundle" },
			{ "<leader>Tol", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
			{ "<leader>Too", "<cmd>OverseerOpen<cr>", desc = "Open" },
			{ "<leader>Toq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
			{ "<leader>Tor", "<cmd>OverseerRun<cr>", desc = "Run" },
			{ "<leader>Tos", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
			{ "<leader>Tot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
		},
		config = true,
	},
	-- {
	--   "andythigpen/nvim-coverage",
	--   cmd = { "Coverage" },
	--   config = true,
	-- },
}
