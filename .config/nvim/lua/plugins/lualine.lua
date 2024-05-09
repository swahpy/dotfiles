return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          file_status = true,     -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
          path = 4,
          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = "[+]",      -- Text to show when the file is modified.
            readonly = "[-]",      -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
            newfile = "[New]",     -- Text to show for newly created file before first write
          },
        },
        --> show current session
        {
          function()
            local session_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/")
            local session = vim.g.persisted_loaded_session:gsub(session_dir, ""):gsub("%%", "%/")
            return "Current session: " .. session
          end,
          cond = function() return package.loaded["persisted"] and vim.g.persisted_exists end,
        },
      },
      lualine_x = {
        --> show macro recording
        {
          function()
            local reg = vim.fn.reg_recording()
            if reg == "" then return "" end -- not recording
            return "recording to " .. reg
          end,
        },
        -- show command
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        },
        -- show if has any lazy updates
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
        },
        "encoding",
        {
          "fileformat",
          symbols = {
            unix = " LF", -- e712
            dos = " CRLF", -- e70f
            mac = " CR", -- e711
          },
        },
        "filetype",
      },
      lualine_y = { "progress", "location" },
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "neo-tree" },
  },
}
