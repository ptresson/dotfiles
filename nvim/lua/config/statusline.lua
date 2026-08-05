vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})
require('lualine').setup {
                options = {
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_b = {{'branch', icons_enabled = false}},
                lualine_c = {{'filename', path=1}},
                lualine_x = {},
                lualine_y = {}
            }
}
