vim.g.mapleader = " "

-- see https://github.com/neovim/neovim/issues/40684 maybe if issues of redundant CR ?
vim.keymap.set("n", "<CR>", ":")
vim.keymap.set("n","<S-CR>","o<Esc>k")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<tab>", "<cmd>bn<CR>")
vim.keymap.set("n", "<S-tab>", "<cmd>bp<CR>")
vim.keymap.set("n", "<Bs>", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>nohl<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n','<leader>E', vim.diagnostic.goto_prev)
vim.keymap.set('n','<leader>e', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '€', 'viw"-y:%s/<C-r>-/<C-r>-/g<Left><Left>')
vim.keymap.set('v', '€', '"-y:%s/<C-r>-/<C-r>-/g<Left><Left>')
