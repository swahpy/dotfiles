return {
  "stevearc/resession.nvim",
  enabled = false,
  config = function ()
    local rs = require("resession")
    rs.setup()

    --> automatically save a session when exiting nvim
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
      -- Always save a special session named "last"
      rs.save("last")
      end,
    })

    --> setup keymaps
    local map = vim.keymap.set
    map("n", "<leader>ss", rs.save, { desc = "Save current session" })
    map("n", "<leader>sr", rs.load, { desc = "Restore session" })
    map("n", "<leader>sd", rs.delete, { desc = "Delete session" })
  end
}
