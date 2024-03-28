return {
    'hrsh7th/nvim-cmp',
    dependencies = { 'LuaSnip' },
    event = 'InsertEnter',
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                -- Use luasnip as the snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                {
                    { name = 'buffer' },
                }
            ),
            mapping = cmp.mapping.preset.insert({
                ['<C-l>'] = cmp.mapping.confirm({select = false}),
                ['<C-h>'] = cmp.mapping.abort(),
                ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                -- FIXME: Cmd doesn't translate ctrl + shift
                ['<C-S-j>'] = cmp.mapping.scroll_docs(1),
                ['<C-S-k>'] = cmp.mapping.scroll_docs(-1),
            })
        })
    end
}
