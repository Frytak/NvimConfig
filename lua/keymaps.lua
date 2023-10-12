local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

-- ====================
-- Standard Vim keymaps
-- ====================

-- Copy/Paste into '+' buffer
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('n', '<Leader>P', '"+P')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>P', '"+P')

vim.keymap.set('n', '<Leader>y', '"+yy')
vim.keymap.set('v', '<Leader>y', '"+y')



-- Navigation (netrw)
    -- Open netrw
    vim.keymap.set('n', '<Leader><Leader>', ':Explore<Enter>')

    -- netrw specific keymaps
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'netrw',
        callback = function()
            local bind = function(lhs, rhs)
                vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
            end

            -- Go out of directory
            bind('h', '-')

            -- Go into directory
            bind('l', '<Enter>')
        end
    })

-- Navigation (telescope)
    -- Find files
    vim.keymap.set('n', '<Leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<Enter>')



-- ============
-- Autocomplete
-- ============
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})

    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-l>'] = cmp.mapping.confirm({select = false}),
            ['<C-h>'] = cmp.mapping.abort(),
            ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
            ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        })
    })
end)
