return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-go",
	},
	opts = function(_, opts)
		vim.list_extend(opts.adapters, {
			require("neotest-go"),
		})
	end,
}
