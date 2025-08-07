return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- VTSLS is the new default for typescript
        vtsls = {
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
