return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    layout = {
      align = "center",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.register({
      ["<leader>c"] = { name = "+code" },
      ["<leader>s"] = { name = "+session" },
      ["<leader>t"] = { name = "+tabs" },
      ["<leader>w"] = { name = "+window" },
      ["<leader><leader>"] = { name = "+misc" },
    })
    wk.setup(opts)
  end
}
