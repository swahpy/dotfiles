local opt = vim.opt -- for conciseness

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- turn off swapfile
opt.swapfile = false

-- the minimium lines kept below or above the cursor line
opt.scrolloff = 10

-- used to align text
opt.colorcolumn = "120"

-- search
opt.hlsearch = true

-- auto reload file when it is changed outside
opt.autoread = true

-- Allow specified keys that move the cursor left/right to move to the
-- previous/next line when the cursor is on the first/last character in
-- the line.
opt.whichwrap = "<,>,[,]"

opt.textwidth = 120

-- enable float window and colorscheme work properly
opt.winblend = 0
opt.termguicolors = true
