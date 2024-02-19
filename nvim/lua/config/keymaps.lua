-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- general keymaps
vim.keymap.set("n", "<CR>", ":", { desc = "Alternative mapping to command mode" })
vim.keymap.set("n", "<S-CR>", "o<esc>k", { desc = "Add blank line without exiting normal mode" })
vim.keymap.set("n", "<Tab>", ":bn<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>d", ":bd<CR>", { desc = "detach buffer" })

-- python keymaps
vim.keymap.set({ "n", "v" }, "<leader>p", "yoprint(<esc>pa)<esc>k", { desc = "Print under current line" })
vim.keymap.set({ "n", "v" }, "<leader>pp", "oprint('pouet')<esc>k", { desc = "Print 'pouet' under current line" })
vim.keymap.set({ "n", "v" }, "<leader>s", "osys.exit(1)<esc>k", { desc = "Add sys exit under current line" })
