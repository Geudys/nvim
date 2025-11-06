return {
    {
        "oxfist/night-owl.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local night_owl = require("night-owl")
            night_owl.setup({
                bold = true,
                italics = true,
                underline = true,
                undercurl = true,
                transparent_background = true,
            })
        end,
    },
}
