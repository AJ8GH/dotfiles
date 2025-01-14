return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
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
  end,
}
