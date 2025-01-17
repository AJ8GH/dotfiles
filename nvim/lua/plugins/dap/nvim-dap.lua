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

    vim.keymap.set("n", "¬", dap_go.debug_last_test)
    vim.keymap.set("n", "†", dap_go.debug_test)
    vim.keymap.set("n", "∂", dap_go.debug_test)
    vim.keymap.set("n", "ø", dap.step_over)
    vim.keymap.set("n", "‘", dap.step_over)
    vim.keymap.set("n", "’", dap.continue)
    vim.keymap.set("n", "≈", ui.toggle)
    vim.keymap.set("n", "®", dap.restart)
    vim.keymap.set("n", "Ù", dap.disconnect)

    vim.keymap.set("n", "<leader>dt", dap_go.debug_test)
    vim.keymap.set("n", "<leader>dl", dap_go.debug_last_test)
    vim.keymap.set("n", "<leader>do", dap.step_over)
    vim.keymap.set("n", "<leader>dd", dap.continue)
    -- use persistent breakpoint instead
    -- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dr", dap.restart)
    vim.keymap.set("n", "<leader>dx", dap.disconnect)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>du", dap.step_out)
    -- vim.keymap.set("n", "<leader>dsb", dap.step_back)
    -- vim.keymap.set("n", "<leader>dro", dap.repl.open)
    -- vim.keymap.set("n", "<leader>drc", dap.repl.close)
    vim.keymap.set("n", "<leader>de", dap.repl.toggle)
    vim.keymap.set("n", "<leader>dc", dap.run_to_cursor)

    -- Eval var under cursor
    vim.keymap.set("n", "<space>de", function()
      ui.eval(nil, { enter = true })
    end)
    vim.keymap.set("n", "<leader>duc", ui.close)
    vim.keymap.set("n", "<leader>duo", ui.open)
    vim.keymap.set("n", "<leader>dut", ui.toggle)

    local types_enabled = true
    local toggle_types = function()
      types_enabled = not types_enabled
      ui.update_render({ max_type_length = types_enabled and -1 or 0 })
    end
    vim.keymap.set("n", "<leader>ut", toggle_types, { desc = "Toggle types in dap ui" })
    dap.listeners.before.attach.dapui_config = function()
      ui.open()
      toggle_types()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
      toggle_types()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
