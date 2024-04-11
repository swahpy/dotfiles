return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        scroll_speed = 8,
        preview_cutoff = 120,
        preview_width = 0.7,
      },
      dynamic_preview_title = true,
    },
  },
  config = function(_, opts)
    local ts = require("telescope")

    ts.setup(opts)

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
      },
    })
  end
}
