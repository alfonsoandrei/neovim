return {
  "3rd/image.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>ti",
      function()
        local image = require("image")
        -- Toggle image display by clearing and showing images
        if vim.g.image_display_enabled == false then
          vim.g.image_display_enabled = true
          image.setup({
            backend = "kitty",
            integrations = {
              markdown = { enabled = true },
              neorg = { enabled = true },
            },
          })
          vim.notify("Images enabled", vim.log.levels.INFO)
        else
          vim.g.image_display_enabled = false
          image.clear()
          vim.notify("Images disabled", vim.log.levels.INFO)
        end
      end,
      desc = "Toggle image display",
    },
  },
  config = function()
    -- Initialize the toggle state
    vim.g.image_display_enabled = true

    require("image").setup({
      backend = "kitty", -- REQUIRED! This tells the plugin to use the Kitty protocol.
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { "norg" },
        },
      },
      -- Optional: set a max width and height for all images
      max_width = 240,
      max_height = 40,
      max_width_window_percentage = nil, -- this is the body
      max_height_window_percentage = nil,
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" }, -- render image files as images when opened
    })
  end,
}
