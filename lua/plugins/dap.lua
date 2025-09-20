-- lua/dap.lua
return {
  {
    "nvim-neotest/nvim-nio", -- required by nvim-dap-ui
    lazy = true, -- optional: only load when needed
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- optional: configure default keymaps
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Start/Continue" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint()
      end, { desc = "Set Breakpoint with Condition" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "Open REPL" })
    end,
  },

  -- Optional UI for better visualizations
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" }, -- <-- added
    config = function()
      local dapui = require("dapui")
      dapui.setup()
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Optional virtual text
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
