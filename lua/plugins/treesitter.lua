return {
  -- Pin to master branch which uses the old module paths that LazyVim expects.
  -- The main branch has an incompatible standalone refactor (nvim-treesitter-textobjects.move
  -- instead of nvim-treesitter.textobjects.move).
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "master",
  },

  -- tree-sitter CLI 0.24+ removed the --no-bindings flag that nvim-treesitter still passes.
  -- Override ts_generate_args to drop that flag.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      require("nvim-treesitter.install").ts_generate_args =
        { "generate", "--abi", tostring(vim.treesitter.language_version) }
      return opts
    end,
  },
}
