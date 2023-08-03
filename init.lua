require("config.options")
require("config.lazy")

if vim.fn.argc(-1) == 0 then
	vim.api.nvim_create_autocmd("User", {
		group = vim.api.nvim_create_augroup("ModernNeovim", { clear = true }),
		pattern = "VeryLazy",
		callback = function()
			require("config.autocmds")
			require("config.keymaps")
			require("utils.contextmenu")
			require("utils.globals")
		end,
	})
else
	require("config.autocmds")
	require("config.keymaps")
	require("utils.contextmenu")
	require("utils.globals")
end

-- TODO - figure out LSP and move these to plugins/*
-- custom setup for ruby-lsp
-- require('lspconfig').ruby_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {
--     FormatRuby = {
--       function()
--         vim.lsp.buf.format({
--           name = "ruby_lsp",
--           async = true,
--         })
--       end,
--       description = "Format using ruby-lsp",
--     },
--   },
-- })

-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig.configs")
-- local util = require("lspconfig.util")
--
-- if not configs.ruby_lsp then
--
--
-- 	local enabled_features = {
-- 		"documentHighlights",
-- 		"documentSymbols",
-- 		"foldingRanges",
-- 		"selectionRanges",
-- 		-- "semanticHighlighting",
-- 		"formatting",
-- 		"codeActions",
-- 	}
--
-- 	configs.ruby_lsp = {
-- 		default_config = {
-- 			cmd = { "bundle", "exec", "ruby-lsp" },
-- 			filetypes = { "ruby" },
-- 			root_dir = util.root_pattern("Gemfile", ".git"),
-- 			init_options = {
-- 				enabledFeatures = enabled_features,
-- 			},
-- 			settings = {},
-- 		},
-- 		commands = {
-- 			FormatRuby = {
-- 				function()
-- 					vim.lsp.buf.format({
-- 						name = "ruby_lsp",
-- 						async = true,
-- 					})
-- 				end,
-- 				description = "Format using ruby-lsp",
-- 			},
-- 		},
-- 	}
-- end
--
-- lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
