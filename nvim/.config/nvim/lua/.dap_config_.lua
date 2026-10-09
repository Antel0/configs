local dap = require("dap")
local dapui = require("dapui")

-- Adapter for C/C++
dap.adapters.c = {
  type = "executable",
  command = "gdb",                 -- must be installed
  args = { "--interpreter=mi" },
}

-- Configuration for C
dap.configurations.c = {
  {
    name = "Launch file",
    type = "c",                     -- must match dap.adapters.c
    request = "launch",
    program = function()
      -- automatically pick ./a.out if it exists
      local default = "./a.out"
      if vim.fn.filereadable(default) == 1 then
        return default
      end
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  }
}

-- Use same config for C++
dap.configurations.cpp = dap.configurations.c

-- DAP UI setup
dapui.setup()

-- Auto-open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- Keymaps
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dl", dap.run_last)
