return {
  "gbprod/yanky.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    picker = {
      telescope = {
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
          },
        },
      },
    },
  },
  config = function(_, opts)
    local yk = require("yanky")
    yk.setup(opts)

    local wk = require("which-key")
    wk.register({
      ["<leader>y"] = {
        name = "+yanky",
        p = {
          "<cmd>Telescope yank_history<cr>",
          "Open yanky history",
        },
        c = {
          "<cmd>YankyClearHistory<cr>",
          "Clear yanky history",
        },
      },
    })
    -- Yanky comes with a text object corresponding to last put text
    vim.keymap.set({ "o", "x" }, "lp", function()
      require("yanky.textobj").last_put()
    end, {})
  end,
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
    { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
    { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put after and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put before and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put after and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
  },
}
