return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          scroll_speed = 8,
          preview_cutoff = 120,
          preview_width = 0.7,
        },
      },
      dynamic_preview_title = true,
      path_display = "smart",
      mappings = {
        i = {
          ["<A-k>"] = "move_selection_previous",
          ["<A-j>"] = "move_selection_next",
          ["<C-t>"] = "select_tab",
          ["<C-x>"] = "select_horizontal",
          ["<C-v>"] = "select_vertical",
          ["<A-h>"] = "move_to_top",
          ["<A-l>"] = "move_to_bottom",
          ["<A-m>"] = "move_to_middle",
          ["<A-s>"] = "toggle_selection",
          ["<A-a>"] = "select_all",
          ["<A-n>"] = "drop_all",
        },
      },
    },
  },
  config = function(_, opts)
    local ts = require("telescope")

    ts.setup(opts)
    ts.load_extension("fzf")
    -- used for yanky.nvim
    ts.load_extension("yank_history")

    -- setup keymaps
    local builtin = require("telescope.builtin")
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = {
        name = "+find",
        f = { function() builtin.find_files() end, "Fuzzy find files in cwd" },
        r = { function() builtin.oldfiles() end, "Fuzzy find recent files" },
        g = { function() builtin.live_grep() end, "Find string in cwd" },
        s = { function() builtin.grep_string() end, "Find the string under your cursor or the visual selection in cwd" },
        t = { function() builtin.treesitter() end, "Find function names, variables, and other symbols from treesitter queries" },
        B = { function() builtin.builtin() end, "Find all of the community maintained pickers built into Telescope" },
        q = { function() builtin.quickfix() end, "Find items in the quickfix list" },
        v = { function() builtin.vim_options() end, "Find vim options" },
        h = { function() builtin.help_tags() end, "Find available help tags" },
        m = { function() builtin.man_pages() end, "Find manpage entries" },
        b = { function() builtin.buffers() end, "Find open buffers in current neovim instance" },
        c = { function() builtin.colorscheme() end, "Find available colorschemes"},
        k = { function() builtin.keymaps() end, "Find normal mode keymappings" },
        F = { function() builtin.filetypes() end, "Find available filetypes" },
        R = { function() builtin.registers() end, "Find vim registers" },
        T = { "<cmd>TodoTelescope<cr>", "Find Todos" },
      },
    })
  end
}
