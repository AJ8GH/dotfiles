vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", "<cmd>qa<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

-- Improved navigation
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>lex", "<cmd>Lexplore<CR>", { desc = "Toggle Netrw in vertical split" })
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open Netrw" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Put preserving buffer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Put from system clipboard" })
vim.keymap.set("n", "<leader>P", [["+P]], { desc = "Put from system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Preserve visual block changes on Ctrl-c" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Create command template to replace current word" }
)

vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a')
vim.keymap.set("n", "<leader>ef", 'oif err != nil {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj')
vim.keymap.set("n", "<leader>el", 'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i')

vim.keymap.set(
  "n",
  "<leader>cd",
  ":cd %:p:h<CR>:pwd<CR>",
  { desc = "Change working directory to the location of the current file" }
)

vim.keymap.set("n", "å", "gT", { desc = "Change tab" })
