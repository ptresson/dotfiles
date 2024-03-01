return{
{
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

            vim.cmd("colorscheme rose-pine")
        end
    },
-- {
--         "EdenEast/nightfox.nvim",
--         config = function()
--             require('nightfox').setup({
--                 -- disable_background = true,
--             })

--             vim.cmd("colorscheme terafox")
--         end
--     },

}
