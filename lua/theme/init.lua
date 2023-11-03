local settings = require('theme/settings')

-- Enable true colors
-- TODO Add support for cterm colors
vim.o.termguicolors = true

vim.api.nvim_set_hl(0, 'Normal', { bg = settings.bg.depth2, fg = settings.fg.text })
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
for i in pairs(settings.types) do
    vim.api.nvim_set_hl(0, i, { fg = settings.types[i].fg })
end

-- Idk
-- vim.api.nvim_set_hl(0, '', { fg = settings. })
