local theme = require('../theme')

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
                colors.bg = theme.bg.depth2
                colors.comment = theme.fg.comment

                -- Sidebars
                colors.bg_sidebar = theme.bg.depth1

                colors.error = theme.diagnostic.error.fg
            end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            on_highlights = function(highlights, colors)
                highlights.LineNr = {
                    fg = theme.fg.comment
                }

                -- Small, empty statusline
                highlights.StatusLine = {
                    bg = theme.lualine.bg,
                    fg = theme.lualine.normal_fg,
                }

                -- Diagnostics
                highlights.DiagnosticError = { fg = theme.diagnostic.error.fg }
                highlights.DiagnosticHint = { fg = theme.diagnostic.hint.fg }
                highlights.DiagnosticInfo = { fg = theme.diagnostic.info.fg }
                highlights.DiagnosticWarn = { fg = theme.diagnostic.warn.fg }

                highlights.DiagnosticVirtualTextError = { fg = theme.diagnostic.error.fg, bg = theme.diagnostic.error.bg }
                highlights.DiagnosticVirtualTextHint = { fg = theme.diagnostic.hint.fg, bg = theme.diagnostic.hint.bg }
                highlights.DiagnosticVirtualTextInfo = { fg = theme.diagnostic.info.fg, bg = theme.diagnostic.info.bg }
                highlights.DiagnosticVirtualTextWarn = { fg = theme.diagnostic.warn.fg, bg = theme.diagnostic.warn.bg }

                -- Diagnostic floating window
                highlights.FloatBorder = theme.diagnostic.floating_window.border
                highlights.NormalFloat = { bg = theme.diagnostic.floating_window.bg, fg = theme.diagnostic.floating_window.fg }

                highlights.StatusLineNC = {
                    bg = "#16161e",
                    fg = "#3b4261"
                }


                -- LSP types
--                highlights.Constant = { } -- Any constant
--                highlights.String = { } -- String constant: "this is a string"
--                highlights.Character = { } -- Character constant: 'c', '\n'
--                highlights.Number = { } -- Number constant: 234, 0xff
--                highlights.Boolean = { } -- Boolean constant: TRUE, false
--                highlights.Float = { } -- Floating point constant: 2.3e10
--                highlights.Identifier = { } -- Variable name
--                highlights.Function = { } -- Vunction name (also: methods for classes)
--                highlights.Statement = { } -- Any statement
--                highlights.Conditional = { } -- if, then, else, endif, switch, etc.
--                highlights.Repeat = { } -- for, do, while, etc.
--                highlights.Label = { } -- case, default, etc.
--                highlights.Operator = { } -- "sizeof", "+", "*", etc.
--                highlights.Keyword = { } -- Any other keyword
--                highlights.Exception = { } -- try, catch, throw
--                highlights.PreProc = { } -- Generic Preprocessor
--                highlights.Include = { } -- Preprocessor #include
--                highlights.Define = { } -- Preprocessor #define
--                highlights.Macro = { } -- Same as Define
--                highlights.PreCondit = { } -- Preprocessor #if, #else, #endif, etc.
--                highlights.Type = { } -- int, long, char, etc.
--                highlights.StorageClass = { } -- static, register, volatile, etc.
--                highlights.Structure = { } -- struct, union, enum, etc.
--                highlights.Typedef = { } -- A typedef
--                highlights.Special = { } -- Special symbol
--                highlights.SpecialChar = { } -- Special character in a constant
--                highlights.Tag = { } -- You can use CTRL-] on this
--                highlights.Delimiter = { } -- Character that needs attention
--                highlights.SpecialComment = { } -- Special things inside a comment
--                highlights.Debug = { } -- Debugging statements
--                highlights.Underlined = { } -- Text that stands out, HTML links
--                highlights.Ignore = { } -- left blank, hidden hl-Ignore
--                highlights.Error = { } -- Erroneous construct
--                highlights.Todo = { } -- TODO FIXME and XXX
            end,
        })
    end
}
