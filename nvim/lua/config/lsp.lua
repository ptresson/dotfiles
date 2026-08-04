vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable({ 'lua_ls', 'pyright' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'gr', vim.lsp.buf.references, 'References')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, 'Format buffer')
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  -- virtual_text = {
  --   spacing = 4,
  --   source = 'if_many',
  --   prefix = '',
  --   transparent_bg = true,
  -- },
  -- signs = {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = 'E',
  --     [vim.diagnostic.severity.WARN] = 'W',
  --     [vim.diagnostic.severity.INFO] = 'I',
  --     [vim.diagnostic.severity.HINT] = 'H',
  --   },
  -- },
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {underline = false, undercurl = false})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {underline = false, undercurl = false})
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', {bg = "none"})
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {bg = "none"})
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', {bg = "none"})
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', {bg = "none"})
