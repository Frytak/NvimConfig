local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'cssls',
        'cssmodules_ls',
        'tsserver',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})
