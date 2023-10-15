local vim = _G.vim
local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

--- Helper function binding keymaps only for a specific buffer
---
--- @param pattern string Buffer name
--- @param callback function Function to call on buffer
local function buffer_bind(pattern, callback)
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
    vim.keymap.set('n', '<Leader><Leader>', function() vim.cmd('Explore') end)

    -- netrw specific keymaps
    buffer_bind('netrw', function()
        -- Go out of directory
        vim.keymap.set('n', 'h', '-', {remap = true, buffer = true})

        -- Go into directory
        vim.keymap.set('n', 'l', '<Enter>', {remap = true, buffer = true})
    end)

-- Navigation (fzf)
    vim.keymap.set('n', '<Leader>f', function() vim.cmd('FZF') end)

-- Navigation (tabs)
    -- Switch Left/Right tab
    vim.keymap.set('n', '<Leader>h', function() vim.cmd('tabprevious') end)
    vim.keymap.set('n', '<Leader>l', function() vim.cmd('tabnext') end)

    -- Go to specified tab or create a new one
    vim.keymap.set('n', '<Leader>n', function()
        local count = vim.v.count
        if (count == 0) then
            vim.cmd(':tabnew')
        else
            vim.cmd(string.format(':%stabnext', count))
        end
    end)

    -- Move tab
    vim.keymap.set('n', '<Leader><S-h>', function() vim.cmd('-tabmove') end)
    vim.keymap.set('n', '<Leader><S-l>', function() vim.cmd('+tabmove') end)
    vim.keymap.set('n', '<Leader>m', function()
        local count = vim.v.count
        if (count == 1) then count = 0 end
        vim.cmd(string.format(':%stabmove', count))
    end)

    -- Close current tab
    vim.keymap.set('n', '<Leader>x', function() vim.cmd('tabclose') end)

    -- Close all tabs
    vim.keymap.set('n', '<Leader><S-x>', function()
        vim.ui.input({ prompt = 'Are you sure you want to close all the tabs except the current one? (Y/n): ' }, function(input)
            if (input == 'Y') then
                vim.print('Tabs closed.')
                vim.cmd('tabonly')
            elseif (input == 'n') then
                vim.print('No tabs closed.')
            else
                vim.print('Inccorect input. No tabs closed.')
            end
        end)
    end)



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
