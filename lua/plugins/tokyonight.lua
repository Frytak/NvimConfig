local colorado = require('../colorscheme')

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = false },
                keywords = { italic = false },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors)
                colors.bg = colorado.bg.depth2
                colors.comment = colorado.fg.comment

                -- Status line
                colors.bg_statusline = colorado.bg.depth1

                -- Sidebars
                colors.bg_sidebar = colorado.bg.depth1

                colors.error = colorado.fg.error
            end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            on_highlights = function(highlights, colors)
                highlights.LineNr = {
                    fg = colors.comment
                }


                -- Lualine mode colors
                highlights.lualine_a_terminal = {
                    bg = '#ff0000',
                    fg = '#ff0000',
                    bold = true
                }

                highlights.lualine_a_normal = {
                    bg = '#ff0000',
                    fg = '#ff0000',
                }

                highlights.lualine_a_replace = {
                    bg = '#ff0000',
                    fg = '#ff0000',
                    bold = true
                }

                highlights.lualine_a_command = {
                    bg = '#ff0000',
                    fg = '#ff0000',
                    bold = true
                }

                highlights.lualine_a_visual = {
                    bg = '#ff0000',
                    fg = '#ff0000',
                    bold = true
                }
            end,
        })
    end
}
