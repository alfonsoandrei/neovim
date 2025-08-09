-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- opt.relativenumber = false

opt.guicursor = "n:block-blinkon250-blinkoff150,i:ver25"

opt.scrolloff = 8

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
