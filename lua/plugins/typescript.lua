return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        vtsls = {
          on_attach = function()
            vim.api.nvim_set_hl(0, "@lsp.type.function.typescript", { fg = "#C4A7E7" })
          end,
        },
      },
    },
  },
}
