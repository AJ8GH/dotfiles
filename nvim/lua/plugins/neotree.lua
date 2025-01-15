vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>Neotree focus<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>Neotree reveal<CR>")

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
}
