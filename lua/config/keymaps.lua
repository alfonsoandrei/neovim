-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- --- General ---
map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- --- LSP navigation ---
-- Explicit pickers for goto/references. LazyVim's built-in LSP keymaps are
-- registered via Snacks.keymap with an lsp filter, which doesn't always fire
-- under the explicit vim.lsp.enable() path we use in plugins/lsp.lua.
map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
map("n", "gr", function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
map("n", "gi", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
map("n", "gI", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
map("n", "gy", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "Goto Type Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "K", function()
  return vim.lsp.buf.hover()
end, { desc = "Hover" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- --- Files ---
map("n", "<leader>cR", function()
  Snacks.rename.rename_file()
end, { noremap = true, silent = true, desc = "Rename File" })
map("n", "<leader>fI", function()
  require("telescope.builtin").find_files({ no_ignore = true, hidden = true })
end, { desc = "Find Files (no ignore)" })

map("n", "<leader>ppass", function()
  require("utils.password-template").insert()
end, { noremap = true, silent = true, desc = "Insert password template" })

-- --- Spell Checking ---
map("n", "]s", "]s", { noremap = true, silent = true, desc = "Next misspelled word" })
map("n", "[s", "[s", { noremap = true, silent = true, desc = "Previous misspelled word" })
map("n", "z=", "z=", { noremap = true, silent = true, desc = "Spelling suggestions" })
map("n", "<leader>sg", "zg", { noremap = true, silent = true, desc = "Add word to dictionary (good)" })
map("n", "<leader>sw", "zw", { noremap = true, silent = true, desc = "Mark word as misspelled (wrong)" })
map("n", "<leader>sG", "zG", { noremap = true, silent = true, desc = "Add word to session dictionary" })
map("n", "<leader>sW", "zW", { noremap = true, silent = true, desc = "Mark word as wrong for session" })
map("n", "<leader>sug", "zug", { noremap = true, silent = true, desc = "Undo add to dictionary" })
map("n", "<leader>suw", "zuw", { noremap = true, silent = true, desc = "Undo mark as wrong" })
map("n", "<leader>ts", function()
  vim.wo.spell = not vim.wo.spell
  vim.notify(vim.wo.spell and "Spell checking enabled" or "Spell checking disabled", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Toggle spell checking" })

-- --- Surround (Visual) ---
map("v", "S", function()
  local char = vim.fn.getcharstr()
  local pairs = {
    ["("] = { "(", ")" },
    [")"] = { "(", ")" },
    ["b"] = { "(", ")" },
    ["["] = { "[", "]" },
    ["]"] = { "[", "]" },
    ["{"] = { "{", "}" },
    ["}"] = { "{", "}" },
    ["B"] = { "{", "}" },
    ["<"] = { "<", ">" },
    [">"] = { "<", ">" },
  }
  local left, right
  if pairs[char] then
    left, right = pairs[char][1], pairs[char][2]
  else
    left, right = char, char
  end
  vim.cmd("normal! c" .. left .. "\027pa" .. right .. "\027")
end, { noremap = true, desc = "Surround selection" })
