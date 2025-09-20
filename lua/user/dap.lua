-- Mason + DAP setup
local mason_dap = require "mason-nvim-dap"
local dap = require "dap"
local ui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"

-- Virtual text (inline variable values etc.)
dap_virtual_text.setup()

-- Mason DAP
mason_dap.setup {
  ensure_installed = { "cppdbg" },
  automatic_installation = true,
  handlers = {
    function(config) require("mason-nvim-dap").default_setup(config) end,
  },
}

-- Configurations for C and C++
dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    MIMode = "gdb",
    miDebuggerPath = "/usr/bin/gdb", -- check with `which gdb`
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
  },
}

-- Reuse same configs for C++
dap.configurations.cpp = dap.configurations.c

-- DAP UI
ui.setup()
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function() ui.open() end
dap.listeners.before.launch.dapui_config = function() ui.open() end
dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
dap.listeners.before.event_exited.dapui_config = function() ui.close() end

-- Debugger keymaps (WhichKey style)
local wk = require "which-key"

wk.add {
  { "<leader>d", group = "Debugger" },

  { "<leader>dt", function() dap.toggle_breakpoint() end, desc = "Toggle Breakpoint" },
  { "<leader>dC", function() dap.set_breakpoint(vim.fn.input "Condition: ") end, desc = "Conditional Breakpoint" },
  { "<leader>dL", function() dap.set_breakpoint(nil, nil, vim.fn.input "Log message: ") end, desc = "Logpoint" },

  { "<leader>dc", function() dap.continue() end, desc = "Continue" },
  { "<leader>di", function() dap.step_into() end, desc = "Step Into" },
  { "<leader>do", function() dap.step_over() end, desc = "Step Over" },
  { "<leader>du", function() dap.step_out() end, desc = "Step Out" },

  { "<leader>dr", function() dap.repl.open() end, desc = "Open REPL" },
  { "<leader>dl", function() dap.run_last() end, desc = "Run Last" },
  {
    "<leader>dq",
    function()
      dap.terminate()
      ui.close()
    end,
    desc = "Terminate Debugging",
  },

  { "<leader>db", function() dap.list_breakpoints() end, desc = "List Breakpoints" },
  { "<leader>de", function() dap.set_exception_breakpoints { "all" } end, desc = "Exception Breakpoints" },

  { "<leader>dv", function() ui.toggle() end, desc = "Toggle DAP UI" },
  { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variable" },
  {
    "<leader>df",
    function()
      local widgets = require "dap.ui.widgets"
      widgets.centered_float(widgets.frames)
    end,
    desc = "Show Frames",
  },
  {
    "<leader>ds",
    function()
      local widgets = require "dap.ui.widgets"
      widgets.centered_float(widgets.scopes)
    end,
    desc = "Show Scopes",
  },
}
