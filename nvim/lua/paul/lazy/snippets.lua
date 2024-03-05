
return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",

        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            local ls = require("luasnip")

            ls.config.set_config {
            history = true,
            updateevents = "TextChanged, TextChangedI",
            }

            -- ls.filetype_extend("javascript", { "jsdoc" })
            ls.filetype_extend("python", { "pydoc" })

            --- TODO: What is expand?
            -- vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})

            -- vim.keymap.set({"i", "s"}, "<C-k>;", function()
            --     if ls.expand_or_jumpable() then
            --         ls.expand_or_jump()
            --     end
            --     end, {silent = true})
            -- vim.keymap.set({"i"}, "<C-l>;", function()
            --     if ls.choice_active() then
            --         ls.change_choice()
            --     end
            --     end, {silent = true})
            -- vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

            -- vim.keymap.set({"i", "s"}, "<C-E>", function()
            --     if ls.choice_active() then
            --         ls.change_choice(1)
            --     end
            -- end, {silent = true})
        end,
    }
}
