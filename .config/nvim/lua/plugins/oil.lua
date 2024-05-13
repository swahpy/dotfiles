return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,
    -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
    -- Additionally, if it is a string that matches "actions.<name>",
    -- it will use the mapping at require("oil.actions").<name>
    -- Set to `false` to remove a keymap
    -- See :help oil-actions for a list of all available actions
    keymaps = {
      ["?"] = "actions.show_help",
      ["q"] = "actions.close",
      ["<F5>"] = "actions.refresh",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-l>"] = false,
      ["<C-s>"] = false,
    },
    -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = true,
  },
  config = function (_, opts)
    local oil = require("oil")
    oil.setup(opts)

    --> setup keymaps for oil
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
}
