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
        sorter = "modification_time", -- "case_sensitive",
      },
      view = {
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
        relativenumber = true,
        centralize_selection = true,
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
        -- these files won't display
        custom = {
          ".DS_Store",
        },
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
    -- when adding a new file, directly open it in a new tab
    local api = require("nvim-tree.api")
    local event = api.events.Event
    api.events.subscribe(event.FileCreated, function(file)
      vim.cmd("tabnew " .. file.fname)
    end)
    -- Expand nvim-tree when it's open
    ---@diagnostic disable-next-line: unused-local
    api.events.subscribe(event.TreeOpen, function(data)
      api.tree.expand_all()
    end
    )
    -- set key bindings
    local wk = require("which-key")
    wk.register({
      ["<leader>e"] = {
        name = "+explorer",
        t = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
        f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
        r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
        c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
        e = { function()
          api.tree.expand_all()
        end, "Expand file explorer" },
      },
    })
  end,
}
