local Theme = {
    --- Basic background colors (lower depth means darker)
    bg = {
        depth0 = '#060606',
        depth1 = '#0B0B0B',
        depth2 = '#121212', -- Main bg color
        depth3 = '#181818',
        depth4 = '#1B1B1B',
    },

    fg = {
        text = '#A7B7B7',
        comment = '#666666',
    },
}

--- Backgrounds are derived from foreground colors using https://colordesigner.io/gradient-generator
--- set to 16 gradients and choosing the third color.
Theme.diagnostic = {
    error = {
        bg = '#301913',
        fg = '#FF0000',
        icon = '',
    },

    warn = {
        bg = '#2a2317',
        fg = '#DCA523',
        icon = '',
    },

    info = {
        bg = '#1c2427',
        fg = '#4BADC6',
        icon = '',
    },

    hint = {
        bg = '#222918',
        fg = '#8BDC23',
        icon = '',
    },

    floating_window = {
        bg = Theme.bg.depth2,
        fg = Theme.fg.text,

        border = {
            bg = Theme.bg.depth2,
            fg = Theme.fg.comment,
        },
    }
}

Theme.diff = {
    added = {
        bg = '#00ff00',
        fg = '#86D13A',
        icon = '+',
    },

    modified = {
        bg = '#00ff00',
        fg = '#DFDB3B',
        icon = '~',
    },

    removed = {
        bg = '#00ff00',
        fg = '#E03421',
        icon = '-',
    },
}

local chars = '#72A22D'
local keywords = '#1DD197'
local numbers = '#CC822D'
local types = '#9756DE'
local identifier = '#6395B3'

Theme.types = {
    String = { fg = chars }, -- String constant: "this is a string"
    Character = { fg = chars }, -- Character constant: 'c', '\n'

    -- Basic values and operators
    Number = { fg = numbers }, -- Number constant: 234, 0xff
    Boolean = { fg = numbers }, -- Boolean constant: TRUE, false
    Float = { fg = numbers }, -- Floating point constant: 2.3e10
    Operator = { fg = numbers }, -- "sizeof", "+", "*", etc.

    -- Names
    Identifier = { fg = identifier }, -- Variable name
    Function = { fg = keywords }, -- Function name (also: methods for classes)

    -- Keywords
    Statement = { fg = keywords }, -- Any statement
    Conditional = { fg = keywords }, -- if, then, else, endif, switch, etc.
    Repeat = { fg = keywords }, -- for, do, while, etc.
    Label = { fg = keywords }, -- case, default, etc.
    Keyword = { fg = keywords }, -- Any other keyword
    Exception = { fg = keywords }, -- try, catch, throw
    StorageClass = { fg = keywords }, -- static, register, volatile, etc.
    Typedef = { fg = keywords }, -- A typedef
    Special = { fg = keywords }, -- Special symbol

    -- Types
    Type = { fg = types }, -- int, long, char, etc.
    Structure = { fg = types }, -- struct, union, enum etc.
    Constant = { fg = types }, -- Any constant


    -- Preprocessors
    PreProc = { fg = '#FF0000' }, -- Generic Preprocessor
    Include = { fg = '#FF0000' }, -- Preprocessor #include
    Define = { fg = '#FF0000' }, -- Preprocessor #define
    Macro = { fg = '#FF0000' }, -- Same as Define
    PreCondit = { fg = '#FF0000' }, -- Preprocessor #if, #else, #endif, etc.

    SpecialChar = { fg = '#FF0000' }, -- Special character in a constant
    Tag = { fg = '#FF0000' }, -- You can use CTRL-] on this
    Delimiter = { fg = '#FF0000' }, -- Character that needs attention
    SpecialComment = { fg = '#E755E4' }, -- Special things inside a comment
    Debug = { fg = '#FF0000' }, -- Debugging statements
    Underlined = { fg = '#FF0000' }, -- Text that stands out, HTML links

    Ignore = { fg = '#FF0000' }, -- left blank, hidden hl-Ignore

    Error = { fg = Theme.diagnostic.error.fg }, -- Erroneous construct

    Comment = { fg = '#666666' }, -- Comments such as this text!

    -- FIXME
    Todo = { bg = Theme.bg.depth4, fg = Theme.fg.text }, -- TODO FIXME and XXX
}

Theme.lualine = {}
Theme.lualine.bg = Theme.bg.depth0

Theme.lualine.mode_fg = '#000000'
Theme.lualine.normal_fg = Theme.fg.text


Theme.lualine.mode = {
    normal = {
        a = { bg = '#3f80a3', fg = Theme.lualine.mode_fg },
        b = { bg = '#30556b', fg = Theme.lualine.mode_fg },
        c = { bg = Theme.lualine.bg, fg = Theme.lualine.normal_fg },
    },

    visual = {
        a = { bg = '#8551BD', fg = Theme.lualine.mode_fg },
        b = { bg = '#59397B', fg = Theme.lualine.mode_fg },
        c = { bg = Theme.lualine.bg, fg = Theme.lualine.normal_fg },
    },

    insert = {
        a = { bg = '#4B9B47', fg = Theme.lualine.mode_fg },
        b = { bg = '#366632', fg = Theme.lualine.mode_fg },
        c = { bg = Theme.lualine.bg, fg = Theme.lualine.normal_fg },
    },

    replace = {
        a = { bg = '#C33030', fg = Theme.lualine.mode_fg },
        b = { bg = '#812723', fg = Theme.lualine.mode_fg },
        c = { bg = Theme.lualine.bg, fg = Theme.lualine.normal_fg },
    },

    terminal = {
        a = { bg = '#DBB221', fg = Theme.lualine.mode_fg },
        b = { bg = '#8F7420', fg = Theme.lualine.mode_fg },
        c = { bg = Theme.lualine.bg, fg = Theme.lualine.normal_fg },
    },
}

return Theme
