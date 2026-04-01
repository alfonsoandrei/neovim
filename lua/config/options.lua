-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Remap .mjs filetype so vtsls doesn't attach and crash trying to load tsconfig.json.
-- The javascript treesitter parser is registered for syntax highlighting.
vim.filetype.add({ extension = { mjs = "mjs" } })
vim.treesitter.language.register("javascript", "mjs")

-- opt.relativenumber = false

opt.guicursor = "n:block-blinkon250-blinkoff150,i:ver25"

opt.scrolloff = 4

-- Session options for auto-session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Conceal settings for better LaTeX and markdown rendering
opt.conceallevel = 2
opt.concealcursor = ""

-- Spell checking for markdown files
opt.spelllang = "en_us"
opt.spellsuggest = "best,9" -- Show 9 best suggestions
opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add" -- Custom dictionary location

-- enable error float diagnostics
-- See configs in keymaps to trigger the float
-- Crrently set to   "<leader>r",
vim.diagnostic.config({
  virtual_text = false, -- Disable virtual text
  float = {
    source = "always", -- Show source in the floating window
    border = "rounded", -- Use rounded border for the floating window
    width = 80, -- Set your desired width here
  },
})

-- Auto-commands for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = ""
    vim.opt_local.suffixesadd:append(".md")

    -- Follow markdown links: [text](path) and [[path]]
    vim.keymap.set("n", "gf", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2] + 1

      -- Try standard markdown link: [text](path)
      for link_start, path, link_end in line:gmatch("()%[.-%]%((.-)%)()") do
        if col >= link_start and col < link_end then
          path = path:gsub("#.*$", "")
          if path ~= "" then
            vim.cmd("edit " .. vim.fn.fnameescape(path))
            return
          end
        end
      end

      -- Try wiki-style link: [[path]] or [[path|alias]]
      for link_start, path, link_end in line:gmatch("()%[%[(.-)%]%]()") do
        if col >= link_start and col < link_end then
          path = path:gsub("|.*$", "")
          if not path:match("%.%w+$") then
            path = path .. ".md"
          end
          vim.cmd("edit " .. vim.fn.fnameescape(path))
          return
        end
      end

      -- Fallback to built-in gf
      vim.cmd("normal! gF")
    end, { buffer = true, noremap = true, silent = true, desc = "Follow markdown link" })
  end,
})
