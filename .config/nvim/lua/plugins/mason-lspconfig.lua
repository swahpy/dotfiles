return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    ensure_installed = {
      "gopls",
      "jsonls",
      "lua_ls",
      "markdown_oxide",
      "pyright",
      "yamlls",
    },
  },
  config = function(_, opts)
    --> setup mason
    local mason = require("mason")
    mason.setup()
    --> setup lsp related keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user_lsp_attach", {clear = true}),
      callback = function(event)
        local map = vim.keymap.set
        local opt = {buffer = event.buf, silent = true}

        opt.desc = "Show line diagnostics"
        map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opt)
        opt.desc = "Go to previous diagnostic"
        map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opt)
        opt.desc = "Go to next diagnostic"
        map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opt)
        opt.desc = "Show documentation for what is under cursor"
        map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opt)
        opt.desc = "Show LSP definitions"
        map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opt)
        opt.desc = "Go to declaration"
        map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt)
        opt.desc = "Show LSP implementations"
        map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt)
        opt.desc = "Show LSP type definitions"
        map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opt)
        opt.desc = "Show LSP references"
        map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opt)
        opt.desc = "Show LSP signature help"
        map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opt)
        opt.desc = "Smart rename"
        map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opt)
        opt.desc = "Format code"
        map({"n", "x"}, "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opt)
        opt.desc = "See available code actions"
        map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opt)
      end,
    })
    --> lsp setup
    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local handlers = {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      --> setup for lua language server
      ["lua_ls"] = function ()
        lspconfig.lua_ls.setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = {'vim'},
              },
              workspace = {
                library = {
                  vim.env.VIMRUNTIME,
                }
              },
            }
          }
        }
      end,
    }
    --> setup mason-lspconfig
    local mlc = require("mason-lspconfig")
    opts.handlers = handlers
    mlc.setup(opts)
  end
}