-- Set theme
require('theme'):setup('theme/settings')
vim.g.python3_host_prog = 'C:\\Program Files\\Python39\\python.exe'

-- Setup 'lazy' plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)




-- Set <Leader> to <Space> earasing all <Space> bindings
vim.keymap.set('n', ' ', '<Nop>', { silent = true, remap = false })
vim.g.mapleader = ' ';

-- Turn on line numbers
vim.o.number = true;

-- Turn on relative line numbers
vim.o.relativenumber = true;

-- Expand <Tab> to spaces
vim.o.expandtab = true;

-- Set <Tab> width to 4
vim.o.tabstop = 4;
vim.o.shiftwidth = 4;

-- Set word wrap
vim.o.breakindent = true;
vim.o.formatoptions = 'l';
vim.o.lbr = true;



-- ============
--  LOAD LAZY!
-- ============
-- The order in which the configuration is set up is important!
-- Some commands like setting the <Leader> HAVE to be before
-- setting up 'lazy'. While plugin specific ones like the
-- colorscheme have to be after (for it to get setup by 'lazy').
require('lazy').setup('plugins')



local cmp = require('cmp')
cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
        vim_item.menu = nil
        return vim_item
      end
    }
})

-- Keymaps
require('keymaps')

-- LSP setup
require('lsp')
