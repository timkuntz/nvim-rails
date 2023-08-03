return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          vim.cmd "NeoTreeClose"
        end,
        id = "close-at-the-open"
      }
    }
  },
  keys = {
    { "<leader>tf", "<cmd>Neotree position=left toggle=true<cr>",                   desc = "Neotree Toggle Files" },
    { "<leader>tb", "<cmd>Neotree position=left toggle=true source=buffers<cr>",    desc = "Neotree Toggle Buffers" },
    { "<leader>tg", "<cmd>Neotree position=left toggle=true source=git_status<cr>", desc = "Neotree Toggle Git Status" },
    { "<leader>tr", "<cmd>Neotree reveal %p<cr>",                                   desc = "Neotree Reveal File" },
  },
}
