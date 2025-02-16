-- space bar leader key
vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "l", "j")
vim.keymap.set("n", "k", "k")
vim.keymap.set("n", ";", "l")
-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
