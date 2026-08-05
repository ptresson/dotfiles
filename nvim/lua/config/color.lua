vim.pack.add({ 'https://github.com/rose-pine/neovim' })
vim.pack.add({ {src='https://github.com/RedsXDD/neopywal.nvim', name='neopywal'} })
require('rose-pine').setup({disable_background = true})
vim.cmd("colorscheme rose-pine")


-- require('neopywal').setup({transparent_background = true})
-- -- require('neopywal').setup({})
-- vim.cmd("colorscheme neopywal")
