return require("lazy").setup {
    { "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            jump = {
                autojump = true
            },
            modes = {
                char = {
                    jump_labels = true,
                    multi_line = true,
                }
            },
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },
    {
        "gbprod/yanky.nvim",
        opts = {
            highlight = {
                on_put = false,
                on_yank = true,
                timer = 500,
            },
        },
    }
}
