return {
    'EdenEast/nightfox.nvim',
    config = function()
    require('nightfox').setup({
        options = {
            transparent = false,     -- Disable setting background
            terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            dim_inactive = false,    -- Non focused panes set to alternative background
            module_default = true,   -- Default enable value for modules
            styles = {               -- Style to be applied to different syntax groups
                comments = 'NONE',     -- Value is any valid attr-list value `:help attr-list`
                conditionals = 'NONE',
                constants = 'bold',
                functions = 'NONE',
                keywords = 'NONE',
                numbers = 'NONE',
                operators = 'NONE',
                strings = 'NONE',
                types = 'NONE',
                variables = 'NONE',
            },
            inverse = {             -- Inverse highlight for different types
                match_paren = false,
                visual = false,
                search = false,
            },
            modules = {             -- List of various plugins and additional options
                -- ...
            },
        },
            palettes = {
                nightfox = {
                    bg0 = "#111111", -- Darker bg (status line and float)
                    bg1 = "#191919", -- Default bg
                    sel0 = "#393939", -- Popup bg, visual selection bg
                    sel1 = "#242424", -- Popup sel bg, search bg
                    fg1 = "#ffffff", -- Default foreground (text)
                    fg2 = "#c6c6c6", -- Status line, special chars (=, -, >, <)
                    fg3 = "#4a4a4a", -- Line numbers
                },
            },
            specs = {},
            groups = {},
        })
    end,
}
