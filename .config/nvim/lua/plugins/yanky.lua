return {
  "gbprod/yanky.nvim",
  config = function(_, opts)
    local pk = require("yanky.picker")
    local map = require("yanky.telescope.mapping")
    local yk = require("yanky")
    yk.setup(opts)
    yk.setup({
      picker = {
        select = {
          action = pk.actions.put("gp"),
        },
        telescope = {
          mappings = {
            i = {
              ["<c-p>"] = map.put("p"),
              ["<c-P>"] = map.put("P"),
              ["<c-d>"] = map.delete(),
              ["<c-r>"] = map.set_register(require("yanky.utils").get_default_register()),
            },
          },
        },
      },
    })

    local wk = require("which-key")
    wk.register({
      ["<leader>y"] = {
        name = "+yanky",
        c = {
          "<cmd>YankyClearHistory<cr>",
          "[c]lear yanky history",
        },
        -- Yanky comes with a text object corresponding to last put text
        l = {
          function()
            require("yanky.textobj").last_put()
          end,
          "[l]ast put text",
        },
      },
    })
  end,
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
    { "<A-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
    { "<A-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put after and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put after and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
  },
}
