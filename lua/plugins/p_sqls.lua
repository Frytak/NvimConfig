return {
    'nanotee/sqls.nvim',
    name = 'sqls',
    config = function()
        require('lspconfig').sqls.setup({
            cmd = { 'sqls', '-config', 'C:\\Users\\Frytak\\AppData\\Local\\nvim\\lua\\config\\sqls.yml' },
            --settings = {
            --    sqls = {
            --        connections = {
            --            {
            --                alias = 'millionaires',
            --                driver = 'sqlite3',
            --                dataSourceName = 'C:\\Users\\fryta\\Pulpit\\desk\\Important\\Programming Projects\\Millionaires\\server\\millionaires.db',
            --            },
            --        },
            --    },
            --},
            on_attach = function(client, bufnr)
                vim.keymap.set('n', '<Leader><S-s>', ':SqlsExecuteQuery<Enter>')
                vim.keymap.set('n', '<Leader>s', '<S-v> :\'<,\'>SqlsExecuteQuery<Enter>')
                vim.keymap.set('v', '<Leader>s', ':SqlsExecuteQuery<Enter>')
                require('sqls').on_attach(client, bufnr)
            end
        })
    end
}
