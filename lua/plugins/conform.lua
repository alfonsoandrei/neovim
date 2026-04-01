return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      go = { "goimports", "gofmt" },
      python = { "ruff_format" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
  },
}
