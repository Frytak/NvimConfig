local lsp_zero = require('lsp-zero')

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

        -- doesn't work...
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        ["diagnostics.globals"] = {'vim'}
                        --diagnostics = {
                        --    globals = 'vim',
                        --}
                    }
                },
                on_attach = function(client, bufnr)
                  print('hello lua server')
                end
            })
        end,
    },
})
