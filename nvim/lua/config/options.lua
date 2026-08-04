-- vim.opt.clipboard="unnamedplus"
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"  -- Sync with system clipboard

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = false
vim.opt.cindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.cursorline = true

vim.opt.synmaxcol = 300 -- Syntax highlighting limit
vim.opt.updatetime = 300 -- Faster completion

vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket

vim.opt.winblend = 1 -- Floating window transparency
