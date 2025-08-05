return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "moon",
    disable_italics = true,

    -- This is the correct key for overriding specific syntax groups.
    highlight_groups = {
      Keyword = { fg = "#FFB5FF" },
      -- ["@function"] = { fg = "rose" },
      -- ["@comment"] = { fg = "muted", italic = true },
    },
  },
}
