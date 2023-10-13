local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

--- Helper function binding keymaps only for a specific buffer
---
--- @param pattern string Buffer name
--- @param callback function Function to call on buffer
function buffer_bind(pattern, callback)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = pattern,
        callback = callback,
    })
end

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

-- Exit Terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')



-- Navigation (netrw)
    -- Open netrw
    vim.keymap.set('n', '<Leader><Leader>', ':Explore<Enter>')

    -- netrw specific keymaps
    buffer_bind('netrw', function()
        -- Go out of directory
        vim.keymap.set('n', 'h', '-', {remap = true, buffer = true})

        -- Go into directory
        vim.keymap.set('n', 'l', '<Enter>', {remap = true, buffer = true})
    end)

-- Navigation (telescope)
    -- Find files
    vim.keymap.set('n', '<Leader>f', function() require('telescope.builtin').find_files() end)

    -- telescope specific keymaps
    -- defined in the telescope.lua as I could not get them working here

-- Navigation (tabs)
    -- Switch Left/Right tab
    vim.keymap.set('n', '<Leader>h', '<cmd> tabprevious<Enter>')
    vim.keymap.set('n', '<Leader>l', '<cmd> tabnext<Enter>')

    -- Go to specified tab or create a new one
    vim.keymap.set('n', '<Leader>n', function()
        local count = vim.v.count
        if (count == 0) then
            vim.cmd(':tabnew')
        else
            vim.cmd(string.format(':%stabnext', count))
        end
    end)

    -- Close tab
    vim.keymap.set('n', '<Leader>x', '<cmd> tabclose<Enter>')



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
