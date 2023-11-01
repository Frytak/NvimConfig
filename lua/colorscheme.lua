local Colorscheme = {}
Colorscheme.bg = {
    depth0 = '#060606',
    depth1 = '#0D0D0D',
    depth2 = '#121212',
    depth3 = '#181818',
    depth4 = '#1F1F1F',
}

Colorscheme.fg = {
    text = '#A7B7B7',
    comment = '#666666',
    error = '#FF0000',
}



-- Vim
Colorscheme.vim = {
    diagnostics_colors = {
        error = '#00ff00',
        warn = '#00ff00',
        info = '#00ff00',
        hint = '#00ff00',
    },

    dif_color = {
    },
}



-- Lualine
Colorscheme.lualine = {}
Colorscheme.lualine.bg = Colorscheme.bg.depth1

Colorscheme.lualine.mode_fg = '#000000'
Colorscheme.lualine.normal_fg = Colorscheme.fg.text


Colorscheme.lualine.mode = {
    normal = {
        a = { bg = '#3F80A3', fg = Colorscheme.lualine.mode_fg },
        b = { bg = '#30556B', fg = Colorscheme.lualine.mode_fg },
        c = { bg = Colorscheme.lualine.bg, fg = Colorscheme.lualine.normal_fg },
    },

    visual = {
        a = { bg = '#8551BD', fg = Colorscheme.lualine.mode_fg },
        b = { bg = '#59397B', fg = Colorscheme.lualine.mode_fg },
        c = { bg = Colorscheme.lualine.bg, fg = Colorscheme.lualine.normal_fg },
    },

    insert = {
        a = { bg = '#4B9B47', fg = Colorscheme.lualine.mode_fg },
        b = { bg = '#366632', fg = Colorscheme.lualine.mode_fg },
        c = { bg = Colorscheme.lualine.bg, fg = Colorscheme.lualine.normal_fg },
    },

    replace = {
        a = { bg = '#C33030', fg = Colorscheme.lualine.mode_fg },
        b = { bg = '#812723', fg = Colorscheme.lualine.mode_fg },
        c = { bg = Colorscheme.lualine.bg, fg = Colorscheme.lualine.normal_fg },
    },

    terminal = {
        a = { bg = '#DBB221', fg = Colorscheme.lualine.mode_fg },
        b = { bg = '#8F7420', fg = Colorscheme.lualine.mode_fg },
        c = { bg = Colorscheme.lualine.bg, fg = Colorscheme.lualine.normal_fg },
    },
}

return Colorscheme
