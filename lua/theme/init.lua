local settings = require('theme/settings')

-- Enable true colors
-- TODO Add support for cterm colors
vim.o.termguicolors = true

vim.api.nvim_set_hl(0, 'LineNr', {
    fg = settings.fg.comment
})

-- Small, empty statusline
vim.api.nvim_set_hl(0, 'StatusLine', {
    bg = settings.lualine.bg,
    fg = settings.lualine.normal_fg,
})

-- TODO
vim.api.nvim_set_hl(0, 'StatusLineNC', {
    bg = settings.lualine.bg,
    fg = settings.lualine.normal_fg,
})

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = settings.diagnostic.error.fg })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = settings.diagnostic.hint.fg })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = settings.diagnostic.info.fg })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = settings.diagnostic.warn.fg })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = settings.diagnostic.error.bg, fg = settings.diagnostic.error.fg })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = settings.diagnostic.hint.bg, fg = settings.diagnostic.hint.fg })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = settings.diagnostic.info.bg, fg = settings.diagnostic.info.fg })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = settings.diagnostic.warn.bg, fg = settings.diagnostic.warn.fg })

-- Diagnostic floating window
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = settings.diagnostic.floating_window.bg, fg = settings.diagnostic.floating_window.fg })
vim.api.nvim_set_hl(0, 'FloatBorder', settings.diagnostic.floating_window.border)

-- LSP types
vim.api.nvim_set_hl(0, 'Constant', { fg = settings.types.Constant.fg })
vim.api.nvim_set_hl(0, 'String', { fg = settings.types.String.fg })
vim.api.nvim_set_hl(0, 'Character', { fg = settings.types.Character.fg })
vim.api.nvim_set_hl(0, 'Number', { fg = settings.types.Number.fg })
vim.api.nvim_set_hl(0, 'Boolean', { fg = settings.types.Boolean.fg })
vim.api.nvim_set_hl(0, 'Float', { fg = settings.types.Float.fg })
vim.api.nvim_set_hl(0, 'Comment', { fg = settings.types.Comment.fg })
vim.api.nvim_set_hl(0, 'Identifier', { fg = settings.types.Identifier.fg })
vim.api.nvim_set_hl(0, 'Function', { fg = settings.types.Function.fg })
vim.api.nvim_set_hl(0, 'Statement', { fg = settings.types.Statement.fg })
vim.api.nvim_set_hl(0, 'Conditional', { fg = settings.types.Conditional.fg })
vim.api.nvim_set_hl(0, 'Repeat', { fg = settings.types.Repeat.fg })
vim.api.nvim_set_hl(0, 'Label', { fg = settings.types.Label.fg })
vim.api.nvim_set_hl(0, 'Operator', { fg = settings.types.Operator.fg })
vim.api.nvim_set_hl(0, 'Keyword', { fg = settings.types.Keyword.fg })
vim.api.nvim_set_hl(0, 'Exception', { fg = settings.types.Exception.fg })
vim.api.nvim_set_hl(0, 'PreProc', { fg = settings.types.PreProc.fg })
vim.api.nvim_set_hl(0, 'Include', { fg = settings.types.Include.fg })
vim.api.nvim_set_hl(0, 'Define', { fg = settings.types.Define.fg })
vim.api.nvim_set_hl(0, 'Macro', { fg = settings.types.Macro.fg })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = settings.types.PreCondit.fg })
vim.api.nvim_set_hl(0, 'Type', { fg = settings.types.Type.fg })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = settings.types.StorageClass.fg })
vim.api.nvim_set_hl(0, 'Structure', { fg = settings.types.Structure.fg })
vim.api.nvim_set_hl(0, 'Typedef', { fg = settings.types.Typedef.fg })
vim.api.nvim_set_hl(0, 'Special', { fg = settings.types.Special.fg })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = settings.types.SpecialChar.fg })
vim.api.nvim_set_hl(0, 'Tag', { fg = settings.types.Tag.fg })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = settings.types.Delimiter.fg })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = settings.types.SpecialComment.fg })
vim.api.nvim_set_hl(0, 'Debug', { fg = settings.types.Debug.fg })
vim.api.nvim_set_hl(0, 'Underlined', { fg = settings.types.Underlined.fg })
vim.api.nvim_set_hl(0, 'Ignore', { fg = settings.types.Ignore.fg })
vim.api.nvim_set_hl(0, 'Error', { fg = settings.types.Error.fg })
vim.api.nvim_set_hl(0, 'Todo', { fg = settings.types.Todo.fg })

-- Idk
-- vim.api.nvim_set_hl(0, '', { fg = settings. })
