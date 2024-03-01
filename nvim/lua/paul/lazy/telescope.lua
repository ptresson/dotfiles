return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                    '--hidden',
                },
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
        -- vim.keymap.set('n', '<leader>fc', builtin.find_files, {cwd = '~/.config/'})
        vim.keymap.set('n', '<leader>fc', '<cmd>lua require("telescope.builtin").find_files({cwd = "~/.config/"})<CR>', {noremap = true, silent = true})
    end
}
