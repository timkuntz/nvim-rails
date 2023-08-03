--- Install lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.extras.lang" },
    -- { import = "plugins.extras.ai" },
    { import = "plugins.extras.db" },
    -- { import = "plugins.extras.ui" },
    { import = "plugins.extras.pde" },
  },
  defaults = { lazy = true, version = nil },
  install = { missing = true, colorscheme = { "tokyonight", "gruvbox" } },
  -- dev = { patterns = jit.os:find "Windows" and {} or { "alpha2phi" } },
  checker = { enabled = true },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
-- Configure lazy.nvim
-- require("lazy").setup({
--   spec = {
--     { import = "plugins" },
--     -- { import = "plugins.extras.lang" },
--     -- { import = "plugins.extras.ai" },
--     { import = "plugins.extras.db" },
--     -- { import = "plugins.extras.ui" },
--     { import = "plugins.extras.pde" },
--     -- { import = "plugins.extras.notes" },
--   },
--   defaults = { lazy = true, version = nil },
--   install = { missing = true, colorscheme = { "tokyonight", "gruvbox" } },
--   checker = { enabled = true },
--   performance = {
--     rtp = {
--       disabled_plugins = {
--         "gzip",
--         "matchit",
--         "matchparen",
--         "netrwPlugin",
--         "tarPlugin",
--         "tohtml",
--         "tutor",
--         "zipPlugin",
--       },
--     },
--   },
-- })
vim.keymap.set("n", "<leader>z", "<cmd>:Lazy<cr>", { desc = "Plugin Manager" })

