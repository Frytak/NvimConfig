return {
    'nanotee/sqls.nvim',
    config = function()
        require('lspconfig').sqls.setup({
            cmd = { 'sqls', '-config', 'C:\\Users\\Frytak\\AppData\\Local\\nvim\\lua\\config\\sqls.yml' },

            on_attach = function(client, bufnr)
                vim.keymap.set('n', '<Leader><S-s>', ':SqlsExecuteQuery<Enter>')
                vim.keymap.set('n', '<Leader>s', '<S-v> :\'<,\'>SqlsExecuteQuery<Enter>')
                vim.keymap.set('v', '<Leader>s', ':SqlsExecuteQuery<Enter>')
                require('sqls').on_attach(client, bufnr)
            end
        })
    end
}
