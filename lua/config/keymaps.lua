-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copilot keymaps
-- vim.api.nvim_set_keymap("n", "<leader>cp", ":CopilotChatOpen<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>co", ":CopilotChatClose<CR>", { noremap = true, silent = true })

-- Markdown and LaTeX keymaps
vim.api.nvim_set_keymap("n", "<leader>mp", ":lua require('nabla').popup()<CR>", { noremap = true, silent = true, desc = "Show LaTeX popup" })
vim.api.nvim_set_keymap("n", "<leader>mt", ":lua require('nabla').toggle_virt()<CR>", { noremap = true, silent = true, desc = "Toggle LaTeX virtual text" })
vim.api.nvim_set_keymap("n", "<leader>mv", ":Markview toggle<CR>", { noremap = true, silent = true, desc = "Toggle Markview" })
vim.api.nvim_set_keymap("n", "<leader>p", ":PasteImage<CR>", { noremap = true, silent = true, desc = "Paste image from clipboard" })

-- Image toggle function
vim.keymap.set("n", "<leader>ti", function()
  local image = require("image")
  if vim.g.image_display_enabled == false then
    vim.g.image_display_enabled = true
    -- Re-render images in current buffer
    vim.cmd("edit")  -- Refresh the buffer to show images
    vim.notify("Images enabled", vim.log.levels.INFO)
  else
    vim.g.image_display_enabled = false
    image.clear()
    vim.notify("Images disabled", vim.log.levels.INFO)
  end
end, { noremap = true, silent = true, desc = "Toggle image display" })

-- Additional LaTeX processing with Knap
vim.api.nvim_set_keymap("n", "<leader>kp", ":lua require('knap').process_once()<CR>", { noremap = true, silent = true, desc = "Process LaTeX once" })
vim.api.nvim_set_keymap("n", "<leader>kc", ":lua require('knap').close_viewer()<CR>", { noremap = true, silent = true, desc = "Close LaTeX viewer" })
vim.api.nvim_set_keymap("n", "<leader>kt", ":lua require('knap').toggle_autopreviewing()<CR>", { noremap = true, silent = true, desc = "Toggle auto-preview" })

-- Spell checking keymaps
vim.api.nvim_set_keymap("n", "]s", "]s", { noremap = true, silent = true, desc = "Next misspelled word" })
vim.api.nvim_set_keymap("n", "[s", "[s", { noremap = true, silent = true, desc = "Previous misspelled word" })
vim.api.nvim_set_keymap("n", "z=", "z=", { noremap = true, silent = true, desc = "Spelling suggestions" })
vim.api.nvim_set_keymap("n", "<leader>sg", "zg", { noremap = true, silent = true, desc = "Add word to dictionary (good)" })
vim.api.nvim_set_keymap("n", "<leader>sw", "zw", { noremap = true, silent = true, desc = "Mark word as misspelled (wrong)" })
vim.api.nvim_set_keymap("n", "<leader>sG", "zG", { noremap = true, silent = true, desc = "Add word to session dictionary" })
vim.api.nvim_set_keymap("n", "<leader>sW", "zW", { noremap = true, silent = true, desc = "Mark word as wrong for session" })
vim.api.nvim_set_keymap("n", "<leader>sug", "zug", { noremap = true, silent = true, desc = "Undo add to dictionary" })
vim.api.nvim_set_keymap("n", "<leader>suw", "zuw", { noremap = true, silent = true, desc = "Undo mark as wrong" })

-- Toggle spell checking
vim.keymap.set("n", "<leader>ts", function()
  vim.wo.spell = not vim.wo.spell
  if vim.wo.spell then
    vim.notify("Spell checking enabled", vim.log.levels.INFO)
  else
    vim.notify("Spell checking disabled", vim.log.levels.INFO)
  end
end, { noremap = true, silent = true, desc = "Toggle spell checking" })

-- Restore S behavior in visual mode for surrounding
vim.keymap.set("v", "S", function()
  -- Get the character to surround with
  local char = vim.fn.getcharstr()
  
  -- Define pairs for brackets
  local pairs = {
    ["("] = {"(", ")"},
    [")"] = {"(", ")"},
    ["b"] = {"(", ")"},
    ["["] = {"[", "]"},
    ["]"] = {"[", "]"},
    ["{"] = {"{", "}"},
    ["}"] = {"{", "}"},
    ["B"] = {"{", "}"},
    ["<"] = {"<", ">"},
    [">"] = {"<", ">"},
  }
  
  local left, right
  if pairs[char] then
    left, right = pairs[char][1], pairs[char][2]
  else
    -- For quotes and other characters, use the same on both sides
    left, right = char, char
  end
  
  -- Simple approach: change selection, paste, then append closing char
  vim.cmd("normal! c" .. left .. "\027pa" .. right .. "\027")
end, { noremap = true, desc = "Surround selection" })

-- Obsidian keymaps
vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianNew<CR>", { noremap = true, silent = true, desc = "Create new Obsidian note" })
vim.api.nvim_set_keymap("n", "<leader>oo", ":ObsidianOpen<CR>", { noremap = true, silent = true, desc = "Open note in Obsidian app" })
vim.api.nvim_set_keymap("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true, desc = "Search Obsidian notes" })
vim.api.nvim_set_keymap("n", "<leader>ol", ":ObsidianLinks<CR>", { noremap = true, silent = true, desc = "Show note links" })
vim.api.nvim_set_keymap("n", "<leader>ob", ":ObsidianBacklinks<CR>", { noremap = true, silent = true, desc = "Show backlinks" })
