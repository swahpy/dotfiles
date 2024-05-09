return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- Optional.
    -- For completion
    "hrsh7th/nvim-cmp",
    -- For pickers
    "nvim-telescope/telescope.nvim",
    -- For syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    -- For running lightweight timer
    "epwalsh/pomo.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian/wanghy/",
      },
      {
        name = "no-vault",
        path = function()
          -- alternatively use the CWD:
          -- return assert(vim.fn.getcwd())
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
          notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
          new_notes_location = "current_dir",
          templates = {
            folder = vim.NIL,
          },
          daily_notes = {
            folder = vim.NIL,
          },
          disable_frontmatter = true,
        },
      },
    },

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "notes",

    log_level = vim.log.levels.INFO,

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "dailies",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%Y%B%d",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily.md",
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          -- follow link if possible
          if require("obsidian").util.cursor_on_markdown_link(nil, nil, true) then
            vim.cmd("ObsidianFollowLink")
            return
          end
          -- toggle task if possible, and update todo to done
          -- cycles through your custom UI checkboxes, default: [ ] [x]
          local api = vim.api
          local line = api.nvim_get_current_line()
          local row, _ = unpack(api.nvim_win_get_cursor(api.nvim_get_current_win()))
          if line:find("#todo") then
            line = line:gsub("#todo", "#done")
            api.nvim_buf_set_lines(0, row - 1, row, true, { line })
          elseif line:find("#done") then
            line = line:gsub("#done", "#todo")
            api.nvim_buf_set_lines(0, row - 1, row, true, { line })
          end
          require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      }
    },

    -- Put new notes in the default notes subdirectory. Another is current_dir
    new_notes_location = "notes_subdir",

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        return string.char(math.random(65, 90))
      end
    end,

    -- Optional, customize how note file names are generated given 
    -- the ID, target directory, and title.
    ---@diagnostic disable-next-line
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@diagnostic disable-next-line
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
    end,

    -- Optional, customize how wiki links are formatted. You can set this to one of:
    --  * "use_alias_only", e.g. '[[Foo Bar]]'
    --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
    --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
    --  * "use_path_only", e.g. '[[foo-bar.md]]'
    -- Or you can set it to a function that takes a table of options and returns a string, like this:
    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_id_prefix(opts)
    end,
    -- wiki_link_func = "use_alias_only",

    -- Optional, customize how markdown links are formatted.
    markdown_link_func = function(opts)
      return require("obsidian.util").markdown_link(opts)
    end,

    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",

    -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
    ---@return string
    image_name_func = function()
      -- Prefix image names with timestamp.
      return string.format("%s-", os.time())
    end,

    -- Optional, boolean or a function that takes a filename and returns a boolean.
    -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
    disable_frontmatter = false,

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      -- insert note create date and time
      out.created_at = os.date("%Y-%m-%d %H:%M")

      return out
    end,

    -- Optional, for templates (see below).
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({"open", url})  -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = false,

    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = true,

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "telescope.nvim",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      mappings = {
        -- Create a new note from your query.
        new = "<C-n>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
    },

    -- Optional, sort search results by "path", "modified", "accessed", or "created".
    -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
    -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
    sort_by = "modified",
    sort_reversed = true,

    -- Optional, determines how certain commands open notes. The valid options are:
    -- 1. "current" (the default) - to always open in the current window
    -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
    -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
    open_notes_in = "current",

    -- Optional, configure additional syntax highlighting / extmarks.
    -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
    ui = {
      enable = true,  -- set to false to disable all additional syntax features
      update_debounce = 200,  -- update delay after a text change (in milliseconds)
      -- Define how various check-boxes are displayed
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        -- Replace the above with this if you don't have a patched font:
        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

        -- You can also add more custom ones...
      },
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    -- Specify how to handle attachments.
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "assets/imgs",  -- This is the default
      -- A function that determines the text to insert in the note when pasting an image.
      -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
      -- This is the default implementation.
      ---@diagnostic disable-next-line
      ---@param client obsidian.Client
      ---@diagnostic disable-next-line
      ---@param path obsidian.Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        ---@diagnostic disable-next-line: undefined-field
        path = client:vault_relative_path(path) or path
        ---@diagnostic disable-next-line: undefined-field
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
  config = function(_, opts)
    vim.opt.conceallevel = 2
    local obs = require("obsidian")
    obs.setup(opts)
    -- setup keymaps
    local wk = require("which-key")
    wk.register({
      ["<leader>o"] = {
        name = "+obsidian",
        ["to"] = {
          function()
            local offset = vim.fn.input("Please enter offset(0 or nil for today): ")
            vim.cmd("ObsidianToday " .. offset)
          end,
          "Open or create daily note for today",
        },
        o = {
          function()
            local query = vim.fn.input("Please enter a query(nil for current buffer): ")
            vim.cmd("ObsidianOpen " .. query)
          end,
          "Open current note in Obsidian App",
        },
        n = {
          function()
            local title = vim.fn.input("Enter title or path: ")
            if title ~= "" then
              vim.cmd("ObsidianNew " .. title)
            else
              print("Cancelled.")
            end
          end,
          "Create a new note",
        },
        S = {
          "<cmd>ObsidianQuickSwitch<cr>",
          "Switch to another note in the vault",
        },
        f = {
          function()
            local split = vim.fn.input("Enter split(h/v): ")
            if split == "v" then
              vim.cmd("ObsidianFollowLink " .. "vsplit")
            elseif split == "h" then
              vim.cmd("ObsidianFollowLink " .. "hsplit")
            else
              vim.cmd("ObsidianFollowLink")
            end
          end,
          "Open note reference under the cursor in a horizontal or vertical split window",
        },
        b = {
          "<cmd>ObsidianBacklinks<cr>",
          "Getting a picker list of references to the current buffer",
        },
        Y = {
          "<cmd>ObsidianYesterday<cr>",
          "Open or create a daily note for yesterday",
        },
        T = {
          "<cmd>ObsidianTomorrow<cr>",
          "Open or create a daily note for tomorrow",
        },
        d = {
          function()
            local input = vim.fn.input("Please enter daily range(nil for no all dailies): ")
            if input == "" then
              vim.cmd("ObsidianDailies")
            else
              local match = input:match("%d+%s%d+")
              if match then
                local range = vim.split(input, " ")
                local start = range[1]
                local stop = range[2]
                vim.cmd("ObsidianDailies " .. start .. " " .. stop)
              else
                print("Please enter in following format: [number number].")
              end
            end
          end,
          "Get the list of daily notes",
        },
        m = {
          function()
            local temp = vim.fn.input("Please enter template name: ")
            vim.cmd("ObsidianTemplate " .. temp)
          end,
          "Insert a template from the template list",
        },
        s = {
          function()
            local search = vim.fn.input("Please enter you search: ")
            vim.cmd("ObsidianSearch " .. search)
          end,
          "Find or create a note in the vault",
        },
        ["le"] = {
          function()
            local query = vim.fn.input("Please enter a query(nil for selected text): ")
            vim.cmd("ObsidianLink " .. query)
          end,
          mode = "v",
          "Link an existed inline visual selection of text to a note",
        },
        ["ln"] = {
          function()
            local title = vim.fn.input("Please enter note title(nil for selected text): ")
            vim.cmd("ObsidianLinkNew " .. title)
          end,
          mode = "v",
          "Create a new note and link it to an inline visual selection of text",
        },
        L = {
          "<cmd>ObsidianLinks<cr>",
          "Collect all links within the current buffer into a picker window",
        },
        e = {
          function()
            local title = vim.fn.input("please enter the note title: ")
            vim.cmd("ObsidianExtractNote " .. title)
          end,
          mode = "v",
          "Extract the visually selected text into a new note and link to it",
        },
        c = {
          "<cmd>ObsidianToggleCheckbox<cr>",
          "Cycle through checkbox options",
        },
        i = {
          function()
            local img = vim.fn.input("Please enter the image name: ")
            vim.cmd("ObsidianPasteImg " .. img)
          end,
          "Paste an image from the clipboard into the note at the cursor position"
        },
        ["ta"] = {
          function()
            local tag = vim.fn.input("Tag: ")
            vim.cmd("ObsidianTags " .. tag)
          end,
          "Find notes of the specified tag",
        },
      },
    })
  end,
}
