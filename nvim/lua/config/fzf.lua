vim.pack.add({'https://github.com/ibhagwan/fzf-lua'})
require("fzf-lua").setup({ { "ivy", "border-fused" } })

vim.keymap.set('n', '<leader>ff', function()
  require('fzf-lua').files()
end, { desc = 'Find files' })

vim.keymap.set('n', '<leader>fg', function()
  require('fzf-lua').live_grep()
end, { desc = 'Live grep' })

vim.keymap.set('n', '<leader>fb', function()
  require('fzf-lua').buffers()
end, { desc = 'Find buffers' })

vim.keymap.set('n', '<leader>fr', function()
  require('fzf-lua').oldfiles()
end, { desc = 'Find recent' })
