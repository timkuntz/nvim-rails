return {
	{
		"NvChad/nvterm",
		keys = {
			{
				"<M-h>",
				function()
					require("nvterm.terminal").toggle("horizontal")
				end,
			},
			{
				"<M-v>",
				function()
					require("nvterm.terminal").toggle("vertical")
				end,
			},
		},
		config = function()
			require("nvterm").setup()

			local ft_cmds = {
				irb = "irb " .. vim.fn.expand("%"),
				-- irb = "irb " .. vim.fn.expand('%'),
			}
			local toggle_modes = { "n", "t" }
			local mappings = {
				{
					"n",
					"<C-l>",
					function()
						require("nvterm.terminal").send(ft_cmds[vim.bo.filetype])
					end,
				},
				{
					toggle_modes,
					"<M-h>",
					function()
						require("nvterm.terminal").toggle("horizontal")
					end,
				},
				{
					toggle_modes,
					"<M-v>",
					function()
						require("nvterm.terminal").toggle("vertical")
					end,
				},
				-- { toggle_modes, '<A-i>', function() require("nvterm.terminal").toggle('float') end },
				{ { "t", "i" }, "jk", [[<C-\><C-n>]] },
				{ toggle_modes, "<esc>", [[<C-\><C-n>]] },
				{ toggle_modes, "<C-h>", [[<C-\><C-n><C-W>h]] },
				{ toggle_modes, "<C-j>", [[<C-\><C-n><C-W>j]] },
				{ toggle_modes, "<C-k>", [[<C-\><C-n><C-W>k]] },
				{ toggle_modes, "<C-l>", [[<C-\><C-n><C-W>l]] },
			}
			local opts = { noremap = true, silent = true }
			for _, mapping in ipairs(mappings) do
				vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
			end
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		enabled = true,
		keys = {
			{ [[<C-\>]] },
			{ "<leader>0", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2" },
		},
		cmd = { "ToggleTerm", "TermExec" },
		opts = {
			size = 20,
			hide_numbers = true,
			open_mapping = [[<C-\>]],
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 0.3,
			start_in_insert = true,
			persist_size = true,
			direction = "float",
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		},
	},
}
