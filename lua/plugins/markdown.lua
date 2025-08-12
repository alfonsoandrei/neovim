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

  -- Markview with LaTeX support
  {
    "OXY2DEV/markview.nvim",
    lazy = true,
    ft = { "markdown" },
    config = function()
      vim.g.markview_conceal_same_line = 1
      -- vim.g.markview_log_level = "debug"
      
      require("markview").setup({
        modes = { "n", "i", "no", "c" },
        hybrid_modes = { "i" },
        
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2
            vim.wo[win].concealcursor = "c"
          end
        },
        
        -- LaTeX configuration
        latex = {
          enabled = true,
          inline = {
            enable = true,
          },
          block = {
            enable = true,
          },
        },
        
        -- Math block styling
        block_quotes = {
          enable = true,
        },
        
        -- Code block styling
        code_blocks = {
          enable = true,
          style = "language",
        },
        
        -- Inline code styling
        inline_codes = {
          enable = true,
        },
        
        -- Headings styling
        headings = {
          enable = true,
          shift_width = 0,
        },
        
        -- List styling
        list_items = {
          enable = true,
        },
        
        -- Checkbox styling
        checkboxes = {
          enable = true,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- LaTeX formula rendering
  {
    "jbyuki/nabla.nvim",
    ft = { "markdown", "tex" },
    keys = {
      { "<leader>mp", function() require("nabla").popup() end, desc = "Show LaTeX popup" },
      { "<leader>mt", function() require("nabla").toggle_virt() end, desc = "Toggle LaTeX virtual text" },
    },
  },

  -- Simple LaTeX preview
  {
    "frabjous/knap",
    ft = { "markdown", "tex" },
    keys = {
      { "<leader>kp", function() require("knap").process_once() end, desc = "Process LaTeX once" },
      { "<leader>kc", function() require("knap").close_viewer() end, desc = "Close LaTeX viewer" },
      { "<leader>kt", function() require("knap").toggle_autopreviewing() end, desc = "Toggle auto-preview" },
    },
    config = function()
      local gknapsettings = {
        texoutputext = "pdf",
        textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
        textopdfviewerlaunch = "open %outputfile%",
        textopdfviewerrefresh = "none",
        
        -- Markdown settings
        mdoutputext = "html",
        mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
        mdhtmlviewerlaunch = "open %outputfile%",
        mdhtmlviewerrefresh = "none",
      }
      vim.g.knap_settings = gknapsettings
    end,
  },

  -- Alternative LaTeX rendering with hologram
  {
    "edluffy/hologram.nvim",
    enabled = false, -- Disable for now to avoid conflicts
    config = function()
      require('hologram').setup{
        auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
      }
    end,
  },

  -- VimTeX for LaTeX support
  {
    "lervag/vimtex",
    ft = { "tex", "markdown" },
    config = function()
      vim.g.vimtex_view_method = "skim" -- Use Skim for macOS, change to your preferred PDF viewer
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },

  -- Treesitter configuration for markdown and custom highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    -- The opts function runs BEFORE the plugin is loaded.
    -- We use it to tell nvim-treesitter to install our parsers.
    opts = function(_, opts)
      -- Ensure we have the parsers we need
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "latex" })
      else
        opts.ensure_installed = { "markdown", "markdown_inline", "latex" }
      end
      
      -- Set up highlighting
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.additional_vim_regex_highlighting = { "markdown" }
      
      return opts
    end,
  },
}

