return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┇" },
    exclude = {
      filetypes = {
        "dashboard", -- disable indent line for dashboard
      },
    },
  },
}
