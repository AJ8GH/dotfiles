return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap_go = require("dap-go")
    dap_go.setup()

    vim.keymap.set("n", "<leader>dgt", dap_go.debug_test)
    vim.keymap.set("n", "<leader>dgl", dap_go.debug_last_test)
  end,
}
