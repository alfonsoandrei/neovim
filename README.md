# My Neovim Setup

This is a comprehensive guide to my personal Neovim configuration. It's built on top of the excellent [LazyVim](https://www.lazyvim.org/) framework and customized with a selection of plugins and settings to create a powerful and efficient development environment.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url> ~/.config/nvim
    ```
2.  **Install Neovim:** Make sure you have Neovim v0.9.0 or higher installed.
3.  **Start Neovim:** The first time you start Neovim, `lazy.nvim` will automatically install all the plugins.

## Plugins

This setup uses a variety of plugins to enhance the Neovim experience. Here's a list of the key plugins and their functions:

### Core

*   **[LazyVim](https://www.lazyvim.org/):** The foundation of this configuration.
*   **[lazy.nvim](https://github.com/folke/lazy.nvim):** The plugin manager.

### AI

*   **[copilot.lua](https://github.com/github/copilot.vim):** GitHub Copilot integration.
*   **[CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim):** Copilot Chat integration.

### UI

*   **[rose-pine](https://github.com/rose-pine/neovim):** The primary colorscheme.
*   **[vague.nvim](https://github.com/vague2k/vague.nvim):** An alternative colorscheme.
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A feature-rich statusline.
*   **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua):** A file explorer.
*   **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim):** A stylish bufferline.

### Editing

*   **[harpoon2](https://github.com/ThePrimeagen/harpoon):** A file and buffer management tool.
*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** For advanced syntax highlighting and code parsing.
*   **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp):** A completion engine.
*   **[auto-session](https://github.com/rmagatti/auto-session):** Automatically saves and restores sessions.

### Language Support

*   **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):** The main LSP configuration plugin.
*   **[typos-lsp](https://github.com/crate-ci/typos-lsp):** A typo-checking LSP.
*   **[vtsls](https://github.com/yioneko/vtsls-settings.nvim):** A powerful TypeScript and JavaScript LSP.

### Markdown

*   **[obsidian.nvim](https://github.com/epwalsh/obsidian.nvim):** Obsidian integration.
*   **[markview.nvim](https://github.com/OXY2DEV/markview.nvim):** A Markdown preview plugin.
*   **[image.nvim](https://github.com/3rd/image.nvim):** Displays images in the terminal.

## Keymaps

This configuration uses the standard LazyVim keymaps, with a few additions for specific plugins. Here are some of the custom keymaps:

| Keymap      | Description                  |
| ----------- | ---------------------------- |
| `gD`        | Go to source definition (vtsls) |
| `gR`        | Find file references (vtsls) |
| `<leader>co` | Organize imports (vtsls)     |
| `<leader>cM` | Add missing imports (vtsls)  |
| `<leader>cu` | Remove unused imports (vtsls) |
| `<leader>cD` | Fix all diagnostics (vtsls)  |
| `<leader>cV` | Select TS workspace version (vtsls) |

## Autocmds

There are no custom autocommands defined in this configuration. The `lua/config/autocmds.lua` file is available for adding custom autocommands in the future.

## Options

This configuration sets a few custom options in `lua/config/options.lua`:

*   `opt.guicursor = "n:block-blinkon250-blinkoff150,i:ver25"`: Customizes the cursor style.
*   `opt.scrolloff = 8`: Keeps 8 lines of context around the cursor.
*   Float diagnostics are enabled for a better error-viewing experience.
