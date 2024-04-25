return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    mason.setup()
    local mlc = require("mason-lspconfig")
    mlc.setup({
      ensure_installed = {
        "gopls",
        "jsonls",
        "markdown-oxide",
        "pyright",
        "yamlls",
      },
    })
  end
}
