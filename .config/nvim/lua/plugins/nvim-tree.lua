return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local HEIGHT_RATIO = 0.8 -- You can change this
    local WIDTH_RATIO = 0.5  -- You can change this too

    -- Setup with some options
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
        relativenumber = true,
        float = {
          enable = true,
					open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
        end,
        }
      },
      renderer = {
        add_trailing = true,
        group_empty = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      filters = {
        custom = {
          ".DS_Store",
        },
      },

    })
  end,
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" }
  },
}