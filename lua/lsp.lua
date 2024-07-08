local lsp_zero = require('lsp-zero')
local theme = require('theme/settings')


lsp_zero.set_sign_icons({
  error = theme.diagnostic.error.icon,
  warn = theme.diagnostic.warn.icon,
  hint = theme.diagnostic.hint.icon,
  info = theme.diagnostic.info.icon
})

require('lspconfig').rust_analyzer.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    },
})
