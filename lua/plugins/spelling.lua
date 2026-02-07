return {
  -- Better spell checking with CSpell (understands technical terms better)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- CSpell LSP for better spell checking
        -- Install: npm install -g @cspell/cspell-bundled-dicts
        -- or: npm install -g cspell
        -- Then: npm install -g cspell-cli
        cspell = {
          filetypes = { "markdown", "text", "gitcommit" },
        },
      },
    },
  },

  -- Telescope spell suggest (better UI for z=)
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sz",
        function()
          require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
            previewer = false,
            layout_config = {
              width = 50,
              height = 15,
            },
          }))
        end,
        desc = "Spelling suggestions (Telescope)",
      },
    },
  },
}
