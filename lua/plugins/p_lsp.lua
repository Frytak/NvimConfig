return {
    --{'williamboman/mason.nvim'},
    --{'williamboman/mason-lspconfig.nvim'},

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = { 'nvim-cmp' },
        branch = 'v3.x',
        init = function()
            -- Disable automatic setup
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
        config = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
              lsp_zero.default_keymaps({buffer = bufnr})
            end)
        end,
    },

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
}
