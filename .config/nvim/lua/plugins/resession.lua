return {
  "stevearc/resession.nvim",
  config = function ()
    local rs = require("resession")
    rs.setup()

    --> setup keymaps
    local map = vim.keymap.set
    map("n", "<leader>ss", rs.save, { desc = "Save current session" })
    map("n", "<leader>sr", rs.load, { desc = "Restore session" })
    map("n", "<leader>sd", rs.delete, { desc = "Delete session" })
  end
}
