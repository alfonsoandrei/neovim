-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- opt.relativenumber = false

opt.guicursor = "n:block-blinkon250-blinkoff150,i:ver25"

opt.scrolloff = 8

-- Session options for auto-session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Conceal settings for better LaTeX and markdown rendering
opt.conceallevel = 2
opt.concealcursor = ""

-- Spell checking for markdown files
opt.spelllang = "en_us"

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
  end,
})
