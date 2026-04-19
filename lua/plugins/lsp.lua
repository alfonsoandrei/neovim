return {
  {
    "neovim/nvim-lspconfig",
    -- Load eagerly so vim.lsp.enable() calls are registered before any file opens
    event = "VeryLazy",
    init = function()
      -- Safety net: explicitly enable servers after Lazy finishes.
      -- mason-lspconfig's automatic_enable doesn't fire reliably on Neovim 0.12.
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          local ok, mr = pcall(require, "mason-registry")
          if not ok then
            return
          end
          local ok2, mappings = pcall(require, "mason-lspconfig.mappings")
          if not ok2 then
            return
          end
          local map = mappings.get_mason_map().package_to_lspconfig
          for _, pkg in ipairs(mr.get_installed_package_names()) do
            local name = map[pkg]
            if name then
              pcall(vim.lsp.enable, name)
            end
          end
        end,
      })
    end,
  },
}
