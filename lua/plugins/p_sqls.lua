return {
    'nanotee/sqls.nvim',
    name = 'sqls',
    config = function()
        require('lspconfig').sqls.setup({
            cmd = { 'sqls', '-config', 'C:\\Users\\fryta\\AppData\\Local\\nvim\\lua\\config\\sqls.yml' },
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
                require('sqls').on_attach(client, bufnr)
            end
        })
    end
}
