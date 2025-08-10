return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- VTSLS is the new default for typescript
        vtsls = {
          on_attach = function()
            -- We are applying the highlight after the LSP has attached to ensure it takes priority
            vim.api.nvim_set_hl(0, "@lsp.type.function.typescript", { fg = "#C4A7E7" })
          end,
          settings = {
            typescript = {
              inlayHints = {
                -- Set the inlay hints you want to true
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            -- Also apply the same settings for Javascript
            javascript = {
              inlayHints = {
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          },
        },
      },
    },
  },
}
