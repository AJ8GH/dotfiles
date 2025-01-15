return {
  "ricardoraposo/nightwolf.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("nightwolf").setup({
      theme = "gray", -- 'black', 'dark-blue', 'gray', 'dark-gray', 'light'
      italic = true,
      transparency = false,
      palette_overrides = {},
      highlight_overrides = {},
    })
    vim.cmd.colorscheme("nightwolf")
  end,
}
