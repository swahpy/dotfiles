return {
  "stevearc/conform.nvim",
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" }, -- Conform will run multiple formatters sequentially
      jason = { "jq" },
      lua = { "stylua" },
      markdown = { "markdownlint" },
      python = { "isort", "black" },
      yaml = { "yq" },
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = { "codespell" },
      -- Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
  },
  keys = {
    {
      "<leader><leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
}
