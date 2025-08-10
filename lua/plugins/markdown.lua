return {
  -- Obsidian integration
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/Documents/obsidian-vault/notes/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/Documents/obsidian-vault/notes/**.md",
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    opts = {
      workspaces = {
        {
          name = "personal-notes",
          path = "~/Documents/obsidian-vault/notes",
        },
      },
      ui = {
        enable = true,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      },
    },
  },

  -- Markview
  {
    "OXY2DEV/markview.nvim",
    lazy = true,
    ft = { "markdown" },
    config = function()
      vim.g.markview_conceal_same_line = 1
      -- vim.g.markview_log_level = "debug"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Treesitter configuration for markdown and custom highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    -- The opts function runs BEFORE the plugin is loaded.
    -- We use it to tell nvim-treesitter to install our parsers.
    opts = {
      ensure_installed = { "markdown", "markdown_inline" },
      highlight = {
        enable = true,
      },
    },
  },
}

