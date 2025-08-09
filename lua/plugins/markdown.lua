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

  -- Markdown preview and LaTeX rendering
  {
    "OXY2DEV/markview.nvim",
    lazy = true,
    ft = { "markdown" },
    config = function()
      vim.g.markview_conceal_same_line = 1
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Treesitter configuration for markdown and custom highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- Custom highlighting for ====
      vim.api.nvim_set_hl(0, "ObsidianHighlight", { fg = "#8A2BE2", bold = true }) -- Plum color
    end,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        -- Ensure the markdown parsers are installed
        opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "markdown", "markdown_inline", "math" })
      end
    end,
  },
}