return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    commands = {
      history = {
        view = "popup",
      },
      warnings = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = { warning = true },
        filter_opts = { reverse = true },
      },
    },
    routes = {
      {
        view = "split",
        filter = { event = "msg_show", min_height = 10 },
      },
    },
  },
  config = function(_, opts)
    local noice = require("noice")
    noice.setup(opts)

    -- setup keymaps for noice
    local wk = require("which-key")
    wk.register({
      ["<leader>n"] = {
        name = "+noice",
        a = {
          "<cmd>Noice<cr>",
          "Show message history",
        },
        l = {
          "<cmd>NoiceLast<cr>",
          "Show last message",
        },
        d = {
          "<cmd>NoiceDismiss<cr>",
          "Dismiss all messages",
        },
        e = {
          "<cmd>NoiceErrors<cr>",
          "Show error messages",
        },
        s = {
          "<cmd>NoiceStats<cr>",
          "Show debugging stats",
        },
        w = {
          "<cmd>NoiceWarnings<cr>",
          "Show warning messages",
        },
      },
    })
    vim.keymap.set({ "n", "i", "s" }, "<A-m>", function()
      if not require("noice.lsp").scroll(4) then
        return "<A-m>"
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ "n", "i", "s" }, "<A-n>", function()
      if not require("noice.lsp").scroll(-4) then
        return "<A-n>"
      end
    end, { silent = true, expr = true })
  end
}
