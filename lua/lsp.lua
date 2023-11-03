local lsp_zero = require('lsp-zero')
local theme = require('theme/settings')

lsp_zero.set_sign_icons({
  error = theme.diagnostic.error.icon,
  warn = theme.diagnostic.warn.icon,
  hint = theme.diagnostic.hint.icon,
  info = theme.diagnostic.info.icon
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'cssls',
        'cssmodules_ls',
        'tsserver',
        'html',
        'jsonls',
    },
    handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        }
                    }
                },
            })
        end,
    },
})
