return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/my-notes-vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/my-notes-vault/**.md",
  },
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  opts = {
    workspaces = {
      {
        name = "personal-notes",
        path = "~/my-notes-vault", -- IMPORTANT: Set this to your notes directory
      },
    },
    -- Optional: configure how links are displayed
    ui = {
      enable = true,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
  },
}
