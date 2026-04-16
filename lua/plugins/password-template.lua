local M = {}

function M.insert()
  local template = {
    "Email: ",
    "Username: ",
    "Domain: ",
    "TOTP:",
    " -",
    "---",
    "Description: ",
  }

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, template)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

return M

