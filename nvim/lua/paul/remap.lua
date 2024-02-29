vim.g.mapleader = " "
vim.keymap.set("n", "<CR>", ":")
vim.keymap.set("n","<S-CR>","o<Esc>k")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<tab>", "<cmd>bn<CR>")
vim.keymap.set("n", "<S-tab>", "<cmd>bp<CR>")
vim.keymap.set("n", "<Bs>", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n','<leader>E', vim.diagnostic.goto_prev)
vim.keymap.set('n','<leader>e', vim.diagnostic.goto_next)

---- greatest remap ever
--vim.keymap.set("x", "<leader>p", [["_dP]])
--
---- next greatest remap ever : asbjornHaland
--vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])
