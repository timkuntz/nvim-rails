return {
	-- Git related actions
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	-- git Hub related actions
	{
		"tpope/vim-rhubarb",
		keys = {
			{ "<leader>gb", "<Cmd>GBrowse<Cr>", desc = "[G]ithub [B]rowse" },
		},
	},
	-- Adds git releated signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
