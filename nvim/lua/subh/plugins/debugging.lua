return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup mason-nvim-dap to auto-install codelldb
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      handlers = {},
    })

    -- Setup dap-ui
    dapui.setup()

    -- Open/close dapui automatically
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Keymaps for debugging
    local keymap = vim.keymap
    keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Conditional Breakpoint" })
    keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
    keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
    keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
    keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
    keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
    keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
  end,
}
