return {
	'romgrk/barbar.nvim',
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  event = "BufEnter",
  opts = {
    focus_on_close = "previous",
    icons = {
      pinned = {button = '', filename = true},
    },
    -- Comment below because I use nvim-tree in float mode.
    -- If you set it to sidebar, then enable below config.
		-- sidebar_filetypes = {
		-- 	-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
		-- 	NvimTree = true,
		-- },
  },
  config = function(_, opts)
    local bb = require("barbar")
    bb.setup(opts)

    -- register in which-key
    local wk = require("which-key")
    wk.register({
      ["<leader>t"] = {
        name = "+tabs",
        p = { "<cmd>BufferPrevious<cr>", "Navigate to previous buffer" },
        n = { "<cmd>BufferNext<cr>", "Navigate to next buffer" },
        P = { "<cmd>BufferPin<cr>", "Toggle pin of current buffer" },
        x = { "<cmd>BufferClose<cr>", "Close current buffer" },
        w = { "<cmd>BufferWipeout<cr>", "Wipe out current buffer" },
        s = { "<cmd>BufferPick<cr>", "Enter buffer picking mode" },
        ["1"] = { "<cmd>BufferGoto 1<cr>", "Navigate to first buffer" },
        ["2"] = { "<cmd>BufferGoto 2<cr>", "Navigate to second buffer" },
        ["3"] = { "<cmd>BufferGoto 3<cr>", "Navigate to third buffer" },
        ["4"] = { "<cmd>BufferGoto 4<cr>", "Navigate to fourth buffer" },
        ["5"] = { "<cmd>BufferGoto 5<cr>", "Navigate to fifth buffer" },
        ["6"] = { "<cmd>BufferGoto 6<cr>", "Navigate to sixth buffer" },
        ["7"] = { "<cmd>BufferGoto 7<cr>", "Navigate to seventh buffer" },
        ["8"] = { "<cmd>BufferGoto 8<cr>", "Navigate to eighth buffer" },
        ["9"] = { "<cmd>BufferGoto 9<cr>", "Navigate to ninth buffer" },
        ["0"] = { "<cmd>BufferLast<cr>", "Navigate to last buffer" },
      },
      ["<leader>tm"] = {
        name = "+move",
        p = { "<cmd>BufferMovePrevious<cr>", "Move current buffer to previous position" },
        n = { "<cmd>BufferMoveNext<cr>", "Move current buffer to next position" },
      },
      ["<leader>tc"] = {
        name = "+close",
        c = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all buffers except current one" },
        p = { "<cmd>BufferCloseAllButPinned<cr>", "Close all buffers except pinned one" },
        l = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all left buffers" },
        r = { "<cmd>BufferCloseBuffersRight<cr>", "Close all right buffers" },
        a = { "<cmd>BufferCloseAllButCurrentOrPinned<cr>", "Close all buffers except current one and pinned ones" },
      },
      ["<leader>to"] = {
        name = "+order",
        b = { "<cmd>BufferOrderByBufferNumber<cr>", "Order buffers by buffer number" },
        n = { "<cmd>BufferOrderByName<cr>", "Order buffers by buffer name" },
        d = { "<cmd>BufferOrderByDirectory<cr>", "Order buffers by directory" },
        l = { "<cmd>BufferOrderByLanguage<cr>", "Order buffers by language" },
        w = { "<cmd>BufferOrderByWindowNumber<cr>", "Order buffers by window number" },
      },
    })
  end,
  keys = {
    { "<S-h>", "<cmd>BufferPrevious<cr>", desc = "Navigate to previous buffer" },
    { "<S-l>", "<cmd>BufferNext<cr>", desc = "Navigate to next buffer" },
  },
}
