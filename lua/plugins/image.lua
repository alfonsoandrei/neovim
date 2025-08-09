return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty", -- REQUIRED! This tells the plugin to use the Kitty protocol.
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = true,
        show_uri = true,
      },
    },
    -- Optional: set a max width and height for all images
    max_width = 140,
    max_height = 35,
  },
}
