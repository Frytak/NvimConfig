return {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    config = function ()
        require('lsp-zero').setup()
        local cmp = require('cmp')

        cmp.setup({
          sources = {
            {name = 'nvim_lsp'},
          },
          mapping = {
            ['<C-l>'] = cmp.mapping.confirm({select = false}),
            ['<C-h>'] = cmp.mapping.abort(),
            ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
            ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
            ['<C-p>'] = cmp.mapping(function()
              if cmp.visible() then
                cmp.select_prev_item({behavior = 'insert'})
              else
                cmp.complete()
              end
            end),
            ['<C-n>'] = cmp.mapping(function()
              if cmp.visible() then
                cmp.select_next_item({behavior = 'insert'})
              else
                cmp.complete()
              end
            end),
          },
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
        })
    end,
}
