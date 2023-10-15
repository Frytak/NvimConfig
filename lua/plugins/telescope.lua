return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    'node_modules',
                    '.git',
                    'target',
                    'protoc-23.2',
                }
            },
            pickers = {
                find_files = {
                    mappings = {
                        i = {
                            ['<C-j>'] = require('telescope.actions').move_selection_next,
                            ['<C-k>'] = require('telescope.actions').move_selection_previous,
                            ['<C-h>'] = require('telescope.actions').close,
                            ['<C-l>'] = require('telescope.actions').select_default,
                        },
                        n = {
                            ['<C-j>'] = require('telescope.actions').move_selection_next,
                            ['<C-k>'] = require('telescope.actions').move_selection_previous,
                            ['<C-h>'] = require('telescope.actions').close,
                            ['<C-l>'] = require('telescope.actions').select_default,
                        }
                    },
                }
            }
        })
    end
}
