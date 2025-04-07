return {
    {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config=function ()
        require('nvim-treesitter.configs').setup {
            ensure_installed = "python", -- Make sure Python grammar is installed
            highlight = {
                enable = true, -- Enable Treesitter highlighting
            },
        }
    end

},
    -- {"nvim-treesitter/nvim-treesitter-context",
    -- config = function()
    --     require('treesitter-context').setup({
    --     vim.keymap.set('n', '<leader>ct', function()require('treesitter-context').toggle()end, {})
    --     })
    -- end}
}
