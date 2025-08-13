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
        preview = {
          modes = { "n", "i", "no", "c" },
          hybrid_modes = { "i" },
          callbacks = {
            on_enable = function(_, win)
              vim.wo[win].conceallevel = 2
              vim.wo[win].concealcursor = "c"
            end
          },
        },
        
        -- LaTeX configuration
        latex = {
          inlines = {
            enable = true,
          },
          blocks = {
            enable = true,
          },
        },
        
        -- Markdown configuration
        markdown = {
          -- Block quotes styling
          block_quotes = {
            enable = true,
          },
          
          -- Code block styling
          code_blocks = {
            enable = true,
            style = "language",
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
        },
        
        -- Inline markdown elements
        markdown_inline = {
          -- Checkbox styling
          checkboxes = {
            enable = true,
          },
          
          -- Inline code styling
          inline_codes = {
            enable = true,
          },
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
      vim.g.vimtex_view_method = "general" -- Use general viewer (Preview.app on macOS)
      vim.g.vimtex_view_general_viewer = "open"
      vim.g.vimtex_view_general_options = "-a Preview"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },

  -- Image pasting from clipboard
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- Default configuration
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = true,
        drag_and_drop = {
          insert_mode = true,
        },
        -- Use relative path for better compatibility
        use_absolute_path = false,
        -- Configure the directory where images are saved
        dir_path = "9. Meta/Images", -- Obsidian-style folder organization
      },
      -- Filetypes configuration
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
          -- Override directory for markdown files specifically
          dir_path = "9. Meta/Images",
        },
        -- Obsidian-style configuration
        vimwiki = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
          -- Override directory for vimwiki files specifically
          dir_path = "9. Meta/Images",
        },
      },
    },
    keys = {
      -- `<leader>p` to paste image from clipboard
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
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

