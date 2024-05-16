return {
  "nvim-lua/plenary.nvim",         -- lua functions that many plugis use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "yorickpeterse/nvim-tree-pairs", -- to fix % jump with tree-sitter
  "RRethy/nvim-treesitter-endwise",
  { "numToStr/Comment.nvim", event = "VeryLazy", opts = { ignore = "^$" } },
  {
    "AndrewRadev/splitjoin.vim",
    keys = {
      { "<leader><leader>s", "<cmd>SplitjoinSplit<cr>", desc = "[S]plit current line" },
      { "<leader><leader>j", "<cmd>SplitjoinJoin<cr>",  desc = "[J]oin current line" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "┇" },
      exclude = {
        filetypes = {
          "dashboard", -- disable indent line for dashboard
        },
      },
    },
  },
}
