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

Theme.lualine = {}
Theme.lualine.bg = Theme.bg.depth0

Theme.lualine.mode_fg = '#000000'
Theme.lualine.normal_fg = Theme.fg.text


Theme.lualine.mode = {
    normal = {
        a = { bg = '#3F80A3', fg = Theme.lualine.mode_fg },
        b = { bg = '#30556B', fg = Theme.lualine.mode_fg },
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
