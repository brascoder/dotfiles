local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

-- Elixir DAP — requires ElixirLS; adjust command path if "expert" is not elixir-ls-debugger
dap.adapters.mix_task = {
  type = "executable",
  command = vim.fn.exepath("elixir-ls-debugger") ~= "" and vim.fn.exepath("elixir-ls-debugger") or "debugger.sh",
  args = {},
}
dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = "test",
    taskArgs = { "--trace" },
    request = "launch",
    startApps = true,
    projectDir = "${workspaceFolder}",
    requireFiles = { "test/**/test_helper.exs", "test/**/*_test.exs" },
  },
}
