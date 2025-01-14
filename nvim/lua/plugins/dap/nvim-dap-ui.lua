return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local ui = require("dapui")
    -- vim.keymap.set("n", "<space>?", function()
    --   ui.eval(nil, { enter = true })
    -- end)

    local dap = require("dap")
    vim.keymap.set("n", "<leader>duc", ui.close)
    vim.keymap.set("n", "<leader>duo", ui.open)
    vim.keymap.set("n", "<leader>dut", ui.toggle)

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
