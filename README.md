# Neovim Setup

It's configured on top of [LazyVim](https://www.lazyvim.org/) framework.

## Installation

### Prerequisites

Before setting up this configuration, you'll need to install several external dependencies:

#### Required System Tools

**macOS (via Homebrew):**

```bash
# Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core requirements
brew install neovim                # Neovim v0.9.0+
brew install pngpaste             # Clipboard image pasting
brew install imagemagick          # Image processing
brew install git                  # Version control
brew install ripgrep             # Fast text search
brew install fd                   # Fast file finder
brew install fzf                  # Fuzzy finder
brew install lazygit              # Git TUI

# LaTeX support (choose one)
brew install --cask mactex        # Full MacTeX distribution (recommended)
# OR
brew install basictex             # Minimal TeX distribution
```

**Additional LaTeX packages (if using BasicTeX):**

```bash
sudo tlmgr update --self
sudo tlmgr install latexmk
sudo tlmgr install collection-fontsrecommended
sudo tlmgr install collection-latexextra
```

#### Optional Enhancements

```bash
# Better terminal support for images
brew install --cask kitty         # Kitty terminal (recommended)
# OR
brew install --cask wezterm       # WezTerm terminal
# OR use Ghostty when available

# PDF viewer (if not using built-in Preview.app)
brew install --cask skim          # Alternative PDF viewer
```

#### Node.js Dependencies (Optional)

```bash
# For enhanced LSP and plugin support
brew install node                 # Node.js runtime
npm install -g neovim            # Neovim Node.js provider
npm install -g tree-sitter-cli   # Tree-sitter CLI (optional)
```

### Configuration Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository-url> ~/.config/nvim
    ```
2.  **Install external dependencies** (see Prerequisites above)
3.  **Start Neovim:** The first time you start Neovim, `lazy.nvim` will automatically install all the plugins.
    ```bash
    nvim
    ```
4.  **Verify installation:** Run `:checkhealth` in Neovim to ensure everything is working correctly.

## Plugins

This setup uses a variety of plugins to enhance the Neovim experience. Here's a list of the key plugins and their functions:

### Core

- **[LazyVim](https://www.lazyvim.org/):** The foundation of this configuration.
- **[lazy.nvim](https://github.com/folke/lazy.nvim):** The plugin manager.

### AI

- **[copilot.lua](https://github.com/github/copilot.vim):** GitHub Copilot integration.
- **[CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim):** Copilot Chat integration.

### UI

- **[rose-pine](https://github.com/rose-pine/neovim):** The primary colorscheme.
- **[vague.nvim](https://github.com/vague2k/vague.nvim):** An alternative colorscheme.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A feature-rich statusline.
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua):** A file explorer.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim):** A stylish bufferline.

### Editing

- **[harpoon2](https://github.com/ThePrimeagen/harpoon):** A file and buffer management tool.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** For advanced syntax highlighting and code parsing.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp):** A completion engine.
- **[auto-session](https://github.com/rmagatti/auto-session):** Automatically saves and restores sessions.

### Language Support

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):** The main LSP configuration plugin.
- **[typos-lsp](https://github.com/crate-ci/typos-lsp):** A typo-checking LSP.
- **[vtsls](https://github.com/yioneko/vtsls-settings.nvim):** A powerful TypeScript and JavaScript LSP.

### Markdown & LaTeX

- **[obsidian.nvim](https://github.com/epwalsh/obsidian.nvim):** Obsidian integration for note-taking workflows.
- **[markview.nvim](https://github.com/OXY2DEV/markview.nvim):** Enhanced Markdown rendering with LaTeX support.
- **[image.nvim](https://github.com/3rd/image.nvim):** Displays images in the terminal with Kitty protocol.
- **[img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim):** Paste images from clipboard directly into markdown files.
- **[nabla.nvim](https://github.com/jbyuki/nabla.nvim):** LaTeX formula rendering in popup and virtual text.
- **[vimtex](https://github.com/lervag/vimtex):** Comprehensive LaTeX support with Preview.app integration.
- **[knap](https://github.com/frabjous/knap):** LaTeX and markdown preview with auto-processing.

## Keymaps

This configuration uses the standard LazyVim keymaps, with a few additions for specific plugins. Here are some of the custom keymaps:

### General

| Keymap       | Description                         |
| ------------ | ----------------------------------- |
| `gD`         | Go to source definition (vtsls)     |
| `gR`         | Find file references (vtsls)        |
| `<leader>co` | Organize imports (vtsls)            |
| `<leader>cM` | Add missing imports (vtsls)         |
| `<leader>cu` | Remove unused imports (vtsls)       |
| `<leader>cD` | Fix all diagnostics (vtsls)         |
| `<leader>cV` | Select TS workspace version (vtsls) |

### Markdown & LaTeX

| Keymap       | Description                |
| ------------ | -------------------------- |
| `<leader>mp` | Show LaTeX popup (nabla)   |
| `<leader>mt` | Toggle LaTeX virtual text  |
| `<leader>mv` | Toggle Markview rendering  |
| `<leader>p`  | Paste image from clipboard |
| `<leader>ti` | Toggle image display       |

### LaTeX Processing (Knap)

| Keymap       | Description         |
| ------------ | ------------------- |
| `<leader>kp` | Process LaTeX once  |
| `<leader>kc` | Close LaTeX viewer  |
| `<leader>kt` | Toggle auto-preview |

### Obsidian

| Keymap       | Description               |
| ------------ | ------------------------- |
| `<leader>on` | Create new Obsidian note  |
| `<leader>oo` | Open note in Obsidian app |
| `<leader>os` | Search Obsidian notes     |
| `<leader>ol` | Show note links           |
| `<leader>ob` | Show backlinks            |

### Spell Checking

| Keymap        | Description                      |
| ------------- | -------------------------------- |
| `]s`          | Jump to next misspelled word     |
| `[s`          | Jump to previous misspelled word |
| `z=`          | Show spelling suggestions        |
| `<leader>sg`  | Add word to dictionary (good)    |
| `<leader>sw`  | Mark word as misspelled (wrong)  |
| `<leader>sG`  | Add word to session dictionary   |
| `<leader>sW`  | Mark word as wrong for session   |
| `<leader>sug` | Undo add to dictionary           |
| `<leader>suw` | Undo mark as wrong               |
| `<leader>ts`  | Toggle spell checking on/off     |

### Text Editing

| Keymap    | Mode   | Description                       |
| --------- | ------ | --------------------------------- |
| `S{char}` | Visual | Surround selection with character |

#### Surround Examples

- Select text → `S"` → surround with double quotes
- Select text → `S(` → surround with parentheses
- Select text → `S[` → surround with square brackets
- Select text → `S{` → surround with curly braces
- Select text → `S*` → surround with asterisks

## Autocmds

There are no custom autocommands defined in this configuration. The `lua/config/autocmds.lua` file is available for adding custom autocommands in the future.

## Options

This configuration sets a few custom options in `lua/config/options.lua`:

- `opt.guicursor = "n:block-blinkon250-blinkoff150,i:ver25"`: Customizes the cursor style.
- `opt.scrolloff = 8`: Keeps 8 lines of context around the cursor.
- `opt.sessionoptions`: Properly configured for auto-session with localoptions support.
- `opt.conceallevel = 2`: Enables concealing for better LaTeX and markdown rendering.
- Float diagnostics are enabled for a better error-viewing experience.
- Spell checking and text wrapping are automatically enabled for markdown files.

## Troubleshooting Installation

### Common Issues and Solutions

#### LaTeX Not Working

```bash
# Check if LaTeX is installed
which pdflatex
# If not found, install MacTeX or BasicTeX
brew install --cask mactex

# Check LaTeX distribution
pdflatex --version
```

#### Image Pasting Not Working

```bash
# Check if pngpaste is installed
which pngpaste
# If not found, install it
brew install pngpaste

# Test clipboard functionality
pngpaste test.png  # Should create test.png if clipboard has image
```

#### Tree-sitter Errors

```bash
# Install tree-sitter CLI (optional, not required for basic functionality)
npm install -g tree-sitter-cli
# Or via cargo
cargo install tree-sitter-cli
```

#### Images Not Displaying

- **Terminal support**: Use Kitty, WezTerm, or Ghostty for best image display
- **Protocol check**: Ensure your terminal supports the Kitty graphics protocol
- **ImageMagick**: Verify installation with `convert --version`

#### Plugin Installation Issues

```bash
# Clean plugin cache and reinstall
rm -rf ~/.local/share/nvim/lazy/
nvim --headless +Lazy! +qall
```

#### Health Check

Run comprehensive health check in Neovim:

```vim
:checkhealth
```

Look for specific plugin health checks:

```vim
:checkhealth img-clip
:checkhealth markview
:checkhealth vimtex
:checkhealth lazy
```

### System Requirements Summary

| Component       | Requirement     | Installation                 |
| --------------- | --------------- | ---------------------------- |
| **Neovim**      | v0.9.0+         | `brew install neovim`        |
| **pngpaste**    | Latest          | `brew install pngpaste`      |
| **ImageMagick** | v7.0+           | `brew install imagemagick`   |
| **LaTeX**       | MacTeX/BasicTeX | `brew install --cask mactex` |
| **Git**         | v2.0+           | `brew install git`           |
| **ripgrep**     | Latest          | `brew install ripgrep`       |
| **fd**          | Latest          | `brew install fd`            |
| **Node.js**     | v16+ (optional) | `brew install node`          |

## LaTeX Formula Rendering

This configuration supports rendering LaTeX formulas in Markdown files, making it suitable as an Obsidian-like note-taking environment:

### Inline Math

Use single dollar signs for inline formulas: `$E = mc^2$`

### Block Math

Use double dollar signs for block formulas:

```
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$
```

### Advanced LaTeX Features

- **Matrices**: `\begin{bmatrix} ... \end{bmatrix}`
- **Greek letters**: `\alpha`, `\beta`, `\gamma`, etc.
- **Fractions**: `\frac{a}{b}`
- **Integrals**: `\int_{a}^{b} f(x) dx`
- **Summations**: `\sum_{i=1}^{n} x_i`
- **Mathematical fonts**: Various math fonts supported through Markview

### Usage

1. **Popup rendering:** Place cursor on a LaTeX formula and press `<leader>mp` to see a rendered popup
2. **Virtual text:** Press `<leader>mt` to toggle virtual text rendering of all formulas in the buffer
3. **Enhanced view:** Press `<leader>mv` to toggle Markview's enhanced markdown rendering
4. **LaTeX processing:** Use `<leader>kp` to process and preview LaTeX documents

### Requirements

- LaTeX distribution (pdflatex, latexmk)
- For best results, use a terminal that supports image protocols (Kitty, WezTerm, or Ghostty)

## Image Management

### Clipboard Image Pasting

This configuration includes seamless image pasting from clipboard:

1. **Take a screenshot** (⌘+⇧+4 on macOS)
2. **Position cursor** where you want the image in your markdown file
3. **Press `<leader>p`** to paste the image
4. **Enter filename** when prompted
5. **Image is saved** to `9. Meta/Images/` folder and markdown link is inserted

### Image Display

- **Automatic rendering**: Images display inline in supported terminals
- **Drag and drop**: Supported in insert mode
- **Multiple formats**: PNG, JPG, JPEG, GIF, WebP, SVG
- **Terminal protocols**: Kitty graphics protocol for best performance

### Configuration

- Images saved to relative `9. Meta/Images/` folder
- Markdown template: `![$CURSOR]($FILE_PATH)`
- Compatible with Obsidian workflows

## Dependencies

> **Note:** For complete installation instructions, see the [Prerequisites](#prerequisites) section above.

### Quick Reference

All required dependencies can be installed via Homebrew:

```bash
# Essential tools
brew install neovim pngpaste imagemagick git ripgrep fd fzf lazygit

# LaTeX support
brew install --cask mactex
# OR for minimal installation: brew install basictex

# Optional enhancements
brew install --cask kitty  # Better terminal for image display
brew install node          # For enhanced plugin support
npm install -g neovim      # Neovim Node.js provider
```

### Verification Commands

```bash
# Verify all tools are installed
neovim --version
pngpaste -h
convert --version
pdflatex --version
git --version
rg --version
fd --version
```

See `test-latex.md` and `latex-usage-guide.md` in the config directory for comprehensive examples.
