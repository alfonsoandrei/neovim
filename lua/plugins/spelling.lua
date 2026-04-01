return {
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
