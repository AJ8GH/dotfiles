local fn = function()
  vim.system({ "sqlfmt", "." })
  os.execute("sleep 0.2")
  vim.cmd("bd")
  os.execute("sleep 0.2")
  vim.cmd("b#")
end

vim.keymap.set("n", "<leader>sq", function()
  fn()
end)

vim.keymap.set("n", "œ", function()
  fn()
end)
