return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup({
                preset = "simple",
                options = {
                    multilines = false,  -- Désactive le mode multiligne
                }
            })
            
            -- Désactive les diagnostics virtuels natifs
            vim.diagnostic.config({ virtual_text = false })
        end,
    },
}
