return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")
    local dap_go = require("dap-go")
    local ui = require("dapui")
    require("nvim-dap-virtual-text").setup({})

    ui.setup()
    dap_go.setup()

    vim.keymap.set("n", "<leader>dgt", dap_go.debug_test)
    vim.keymap.set("n", "<leader>dgl", dap_go.debug_last_test)

    vim.keymap.set("n", "<leader>dso", dap.step_over)
    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dbr", dap.restart)
    vim.keymap.set("n", "<leader>dbd", dap.disconnect)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>dou", dap.step_out)
    vim.keymap.set("n", "<leader>dsb", dap.step_back)
    vim.keymap.set("n", "<leader>dro", dap.repl.open)
    vim.keymap.set("n", "<leader>drt", dap.repl.toggle)
    vim.keymap.set("n", "<leader>drc", dap.repl.close)
    vim.keymap.set("n", "<leader>dtc", dap.run_to_cursor)

    -- Eval var under cursor
    vim.keymap.set("n", "<space>de", function()
      ui.eval(nil, { enter = true })
    end)
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
