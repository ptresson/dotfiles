return {
    {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",},
    {"nvim-treesitter/nvim-treesitter-context",
    config = function()
        require('treesitter-context').setup({
        vim.keymap.set('n', '<leader>ct', function()require('treesitter-context').toggle()end, {})
        })
    end}
}
