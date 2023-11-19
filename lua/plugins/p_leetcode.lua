return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        --"rcarriga/nvim-notify",
    },
    opts = {
        -- configuration goes here
        ---@type lc.domain
        domain = "com", -- For now "com" is the only one supported

        ---@type string
        arg = "leetcode.nvim",

        ---@type lc.lang
        lang = "rust",

        ---@type lc.sql
        sql = "mysql",

        ---@type string
        directory = vim.fn.stdpath("data") .. "/leetcode/",

        ---@type boolean
        logging = true,

        console = {
            ---@type boolean
            open_on_runcode = true,

            ---@type "col" | "row"
            dir = "row",

            size = {
                ---@type string | integer
                width = "90%",
                ---@type string | integer
                height = "75%",
            },

            result = {
                ---@type string | integer
                size = "60%",
            },

            testcase = {
                ---@type boolean
                virt_text = true,
                ---@type string | integer
                size = "40%",
            },
        },

        description = {
            ---@type "top" | "right" | "bottom" | "left"
            position = "right",

            ---@type string | integer
            width = "40%",
        },

        hooks = {
            ---@type fun()[]
            LeetEnter = {},

            ---@type fun(question: { lang: string })[]
            LeetQuestionNew = {},
        },

        ---@type boolean
        image_support = false, -- setting this to `true` will disable question description wrap
    },
}
