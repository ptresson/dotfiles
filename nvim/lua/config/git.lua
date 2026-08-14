vim.pack.add({ 'https://github.com/kdheepak/lazygit.nvim' })
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

vim.pack.add({'https://github.com/lewis6991/gitsigns.nvim'})

vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk)
vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk)
vim.keymap.set('n', '<leader>hn', require('gitsigns').nav_hunk('next'))
vim.keymap.set('n', '<leader>hp', require('gitsigns').nav_hunk('prev'))
