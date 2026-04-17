return {
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local dap = require("dap")

      dap.adapters.node = {
        type = "executable",
        command = "node",
        args = { "--inspect-brk", "${workspaceFolder}/${file}" },
      }

      dap.configurations.typescript = {
        {
          name = "Debug NestJS Server",
          type = "node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = {
            "--inspect-brk",
            "-r", "ts-node/register",
            "-r", "tsconfig-paths/register",
            "${workspaceFolder}/src/main.ts",
          },
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
        {
          name = "Nest CLI Debug",
          type = "node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = {
            "--inspect-brk",
            "./node_modules/@nestjs/cli/bin/nest-cli.js",
            "start", "--debug", "--watch",
          },
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
        {
          name = "Jest Test",
          type = "node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = {
            "--inspect-brk",
            "./node_modules/.bin/jest",
            "--runInBand",
            "--testPathPattern",
            "${file}",
          },
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
      }

      dap.configurations.javascript = dap.configurations.typescript
    end,
  },
}