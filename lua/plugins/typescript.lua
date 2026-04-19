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
          settings = {
            typescript = {
              inlayHints = {
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
