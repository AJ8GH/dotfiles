vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", ".", require("oil").toggle_hidden, { desc = "Toggle hidden files in oil" })

return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = false,
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
