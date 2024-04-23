return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugis use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "yorickpeterse/nvim-tree-pairs", -- to fix % jump with tree-sitter
  "RRethy/nvim-treesitter-endwise",
  { 'numToStr/Comment.nvim', lazy = false, opts = { ignore = "^$" } },
  { "kawre/neotab.nvim", event = "InsertEnter" },
}
