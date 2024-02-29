--vim.opt.nu = true
--vim.opt.relativenumber = true
vim.opt.clipboard="unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.keymap.set('n','<leader>E', vim.diagnostic.goto_prev)
vim.keymap.set('n','<leader>e', vim.diagnostic.goto_next)
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {underline = false, undercurl = false})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {underline = false, undercurl = false})
