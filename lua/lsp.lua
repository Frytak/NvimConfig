local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'rust_analyzer'
    },

    handlers = {
        lsp_zero.default_setup,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                single_file_support = false,
                on_attach = function(client, bufnr)
                    print('Hello Rust!')
                end
            })
        end,
    }
})
