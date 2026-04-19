-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.lsp.set_log_level("error")

-- Enable setting the terminal title
vim.opt.title = true

-- Set the format for the title
-- %{getcwd()} is a function that gets the current working directory
vim.opt.titlestring = "nvim - %{fnamemodify(getcwd(), ':t')}"

-- set a title to restore when you exit Neovim
-- vim.opt.titleold = "ghostty"
