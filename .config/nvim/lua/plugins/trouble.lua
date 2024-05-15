return {
  "folke/trouble.nvim",
  branch = "dev",      -- IMPORTANT!
  opts = {
    auto_close = true, -- auto close when there are no items
    auto_open = true,  -- auto open when there are items
    auto_jump = true,  -- auto jump to the item when there's only one
    focus = true,      -- Focus the window when opened
  },
  keys = {
    {
      "<leader>ct",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>cT",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>cL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>cQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
