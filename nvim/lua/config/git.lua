vim.pack.add({ 'https://github.com/kdheepak/lazygit.nvim' })
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

vim.pack.add({'https://github.com/lewis6991/gitsigns.nvim'})

local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)

vim.keymap.set('n', '<leader>hn', function()
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    gitsigns.nav_hunk('next')
  end
end)

vim.keymap.set('n', '<leader>hp', function()
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    gitsigns.nav_hunk('prev')
  end
end)
