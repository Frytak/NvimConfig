local vim = _G.vim
local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local rest = require('rest-nvim')
local wdirs = require('workingdirs')

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

-- Switch between normal and relative line numbers
vim.keymap.set('n', '<Leader>ls', function() vim.wo.relativenumber = (not vim.wo.relativenumber) end)
vim.keymap.set('n', '<Leader>lr', function() vim.wo.relativenumber = true end)
vim.keymap.set('n', '<Leader>ln', function() vim.wo.relativenumber = false end)




-- LSP
vim.keymap.set('n', '<Leader>e', function() vim.lsp.diagnostic.show_line_diagnostics() end)



-- Navigation (netrw)
    -- Open netrw
    vim.keymap.set('n', '<Leader><Leader>', function() vim.cmd('Explore') end)

    -- netrw specific keymaps
    buffer_bind('netrw', function()
        -- Go out of directory
        vim.keymap.set('n', 'h', '-', {remap = true, buffer = true})

        -- Go into directory
        vim.keymap.set('n', 'l', '<Enter>', {remap = true, buffer = true})

        -- Go into directory and make it the working one
        vim.keymap.set('n', '<S-l>', function()
            local path = wdirs.getSelectedDirectory()
            wdirs.changeCurrentWorkingDirectory(path)
            wdirs.openNetrwCurrentWorkingDirectory()
        end, {remap = true, buffer = true})

        -- Go up one directory and make it the working one
        vim.keymap.set('n', '<S-h>', function()
            local path = wdirs.getPreviousDirectory()
            wdirs.changeCurrentWorkingDirectory(path)
            wdirs.openNetrwCurrentWorkingDirectory()
        end, {remap = true, buffer = true})

        -- Make the current directory the working one
        vim.keymap.set('n', '<S-k>', function()
            local path = wdirs.getCurrentDirectory()
            wdirs.changeCurrentWorkingDirectory(path)
        end, {remap = true, buffer = true})
    end)

-- Navigation (fzf)
vim.keymap.set('n', '<Leader>f', function()
    -- Create a new empty buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Get the current window dimensions
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- Calculate the floating window size and position
    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8)
    local row = math.ceil((height - win_height) / 2)
    local col = math.ceil((width - win_width) / 2)

    -- Set some options for the floating window
    local opts = {
      relative = "editor",
      width = win_width,
      height = win_height,
      row = row,
      col = col,
      style = "minimal"
    }

    -- Create a new floating window
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Start a terminal job in the buffer
    local job_id = vim.api.nvim_open_term(buf, {})

    -- Send the shell command to the terminal job
    vim.api.nvim_chan_send(job_id, "ls\n")
end)
-- bat --color=always --style=grid init.lua

    buffer_bind('fzf', function()
        -- Bind <Esc> to exit
        vim.keymap.set('t', '<Esc>', '<cmd>q<Enter>', {remap = true, buffer = true})
    end)

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

-- Navigation (windows)
    -- Change to vertical split
    vim.keymap.set('n', '<Leader>wv', '<C-w>t<C-w>K')

    -- Change to horizontal split
    vim.keymap.set('n', '<Leader>wb', '<C-w>t<C-w>H')

    -- Switch window
    vim.keymap.set('n', '<Leader>ww', '<C-w><C-w>')
    vim.keymap.set('n', '<Leader>wh', '<C-w><C-h>')
    vim.keymap.set('n', '<Leader>wl', '<C-w><C-l>')
    vim.keymap.set('n', '<Leader>wk', '<C-w><C-k>')
    vim.keymap.set('n', '<Leader>wj', '<C-w><C-j>')

    -- Resize
    vim.keymap.set('n', '<Leader>w<S-h>', '<C-w><')
    vim.keymap.set('n', '<Leader>w<S-l>', '<C-w>>')
    vim.keymap.set('n', '<Leader>w<S-k>', '<C-w>-')
    vim.keymap.set('n', '<Leader>w<S-j>', '<C-w>+')

-- Navigation (custom)
    vim.keymap.set('n', '<Leader>d', function() wdirs.prettyChangeDirectory() end)



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
            ['<S-C-j>'] = cmp.mapping.scroll_docs(1),
            ['<S-C-k>'] = cmp.mapping.scroll_docs(-1),
        })
    })
end)



-- ====
-- Rest
-- ====
vim.keymap.set('n', '<Leader>r', function() rest.run() end)
