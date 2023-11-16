--- TODO: Add support for cterm colors
--- TODO: Make `MatchParen` take precedence before Visual selection (and other tags, when selecting luadocs it erases the color)
--- TODO: Break up functions even more and add them to general groups like the settings
local Theme = {}



Theme.settings = require('theme/settings')
Theme.utils = {}

--- Gets lualine colors based on the current mode 
--- @param theme table
--- @return table
Theme.utils.currentLualineColor = function(theme)
    local lualineSection = 'a'
    local mode = string.lower(string.sub(vim.fn.mode(), 1, 2))
    local colors = {
        -- Normal
        ['n'] = theme.settings.lualine.mode.normal[lualineSection],

        -- Visual
        ['v'] = theme.settings.lualine.mode.visual[lualineSection],

        -- Insert
        ['i'] = theme.settings.lualine.mode.insert[lualineSection],
        ['s'] = theme.settings.lualine.mode.insert[lualineSection],

        -- Replace
        ['r'] = theme.settings.lualine.mode.replace[lualineSection],

        -- Terminal
        ['t'] = theme.settings.lualine.mode.terminal[lualineSection],
        ['c'] = theme.settings.lualine.mode.terminal[lualineSection],
        ['!'] = theme.settings.lualine.mode.terminal[lualineSection],
    }

    return colors[mode]
end



Theme.enableTrueColors = function()
    vim.o.termguicolors = true
end

Theme.setNormal = function(self)
    vim.api.nvim_set_hl(0, 'Normal', { bg = self.settings.bg.depth2, fg = self.settings.fg.text })
end

Theme.setPMenu = function(self)
    vim.api.nvim_set_hl(0, 'Pmenu', self.settings.completionMenu.all)
    vim.api.nvim_set_hl(0, 'PmenuSel', self.settings.completionMenu.selected)
end

Theme.setNetrw = function(self)
    vim.api.nvim_set_hl(0, 'netrwDir', self.settings.netrw.directory)
    vim.api.nvim_set_hl(0, 'netrwPlain', self.settings.netrw.file)

    vim.api.nvim_set_hl(0, 'netrwComment', self.settings.netrw.comment)
    vim.api.nvim_set_hl(0, 'netrwQuickHelp', self.settings.netrw.comment)

    vim.api.nvim_set_hl(0, 'netrwList', self.settings.netrw.list)
    vim.api.nvim_set_hl(0, 'netrwHelpCmd', self.settings.netrw.command)
    vim.api.nvim_set_hl(0, 'netrwClassify', self.settings.netrw.slash)
    vim.api.nvim_set_hl(0, 'netrwCmdSep', self.settings.netrw.separator)
    vim.api.nvim_set_hl(0, 'netrwCmdNote', self.settings.netrw.note)
    vim.api.nvim_set_hl(0, 'netrwQHTopic', self.settings.netrw.topic)
    vim.api.nvim_set_hl(0, 'netrwVersion', self.settings.netrw.version)
    vim.api.nvim_set_hl(0, 'netrwTreeBar', self.settings.netrw.treeBar)

    vim.api.nvim_set_hl(0, 'netrwSizeDate', self.settings.netrw.sizeAndDate)
    vim.api.nvim_set_hl(0, 'netrwTime', self.settings.netrw.time)
    vim.api.nvim_set_hl(0, 'netrwDateSep', self.settings.netrw.dateSeparator)
    vim.api.nvim_set_hl(0, 'netrwTimeSep', self.settings.netrw.timeSeparator)

    vim.api.nvim_set_hl(0, 'CursorLine', self.settings.netrw.lineHighlight)
end

Theme.setMatchParen = function(self)
    vim.api.nvim_set_hl(0, 'MatchParen', self.settings.matchParen)
end

Theme.setSelection = function(self)
    vim.api.nvim_set_hl(0, 'Visual', self.settings.selection)
end

Theme.setLeftGutter = function(self)
    vim.api.nvim_set_hl(0, 'EndOfBuffer', self.settings.leftGutter.endOfBuffer)
    vim.api.nvim_set_hl(0, 'SignColumn', self.settings.leftGutter.signColumn)
end

Theme.setSearch = function(self)
    vim.api.nvim_set_hl(0, 'Search', self.settings.search.all)
    vim.api.nvim_set_hl(0, 'CurSearch', self.settings.search.current)
end

Theme.setTabs = function(self)
    -- TODO: Fix entering the command-line window

    vim.cmd('au! frytak_theme_tabs ModeChanged')
    --vim.cmd('au! frytak_theme_tabs CmdwinEnter,CmdwinLeave')
    vim.api.nvim_set_hl(0, 'TabLine', self.settings.tabs.normal)
    vim.api.nvim_set_hl(0, 'TabLineFill', { bg = self.settings.tabs.fill })

    if (self.settings.tabs.modeBasedColor == true) then
        vim.cmd('au frytak_theme_tabs ModeChanged *:* lua require(\'theme\'):setTabs()')
        --vim.cmd('au frytak_theme_tabs CmdwinEnter,CmdwinLeave : lua require(\'theme\'):setTabs()')
        vim.api.nvim_set_hl(0, 'TabLineSel', self.utils.currentLualineColor(self))
    else
        vim.api.nvim_set_hl(0, 'TabLineSel', self.settings.tabs.selected)
    end
end

Theme.setLineNr = function(self)
    vim.api.nvim_set_hl(0, 'LineNr', { fg = self.settings.fg.comment })
end

Theme.setStatusLine = function(self)
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = self.settings.lualine.bg, fg = self.settings.lualine.normal_fg })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = self.settings.lualine.bgNC, fg = self.settings.lualine.normal_fg })
end

Theme.setDiagnostics = function(self)
    vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = self.settings.diagnostic.error.fg })
    vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = self.settings.diagnostic.hint.fg })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = self.settings.diagnostic.info.fg })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = self.settings.diagnostic.warn.fg })
end

Theme.setVirtualDiagnostics = function(self)
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = self.settings.diagnostic.error.bg, fg = self.settings.diagnostic.error.fg })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = self.settings.diagnostic.hint.bg, fg = self.settings.diagnostic.hint.fg })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = self.settings.diagnostic.info.bg, fg = self.settings.diagnostic.info.fg })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = self.settings.diagnostic.warn.bg, fg = self.settings.diagnostic.warn.fg })
end

Theme.setFloatingWindow = function(self)
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = self.settings.diagnostic.floating_window.bg, fg = self.settings.diagnostic.floating_window.fg })
    vim.api.nvim_set_hl(0, 'FloatBorder', self.settings.diagnostic.floating_window.border)
end

Theme.setLSP = function(self)
    for i in pairs(self.settings.types) do
        vim.api.nvim_set_hl(0, i, { fg = self.settings.types[i].fg })
    end
end

Theme.reloadAll = function(self)
    self.enableTrueColors()

    self:setNormal()
    self:setPMenu()
    self:setNetrw()
    self:setMatchParen()
    self:setSelection()
    self:setLeftGutter()
    self:setSearch()
    self:setTabs()
    self:setLineNr()
    self:setStatusLine()
    self:setDiagnostics()
    self:setVirtualDiagnostics()
    self:setFloatingWindow()
    self:setLSP()
end

Theme.setup = function(self, settings)
    vim.cmd('aug frytak_theme_tabs')
    self.settings = require(settings)

--    vim.api.nvim_create_user_command('ReloadTheme', function()
--        local theme = require('theme')
--        print(require('theme/settings').bg.depth2)
--        theme:reloadAll()
--    end, {bang = false})

    self:reloadAll()
end

return Theme
