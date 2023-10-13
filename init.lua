-- Setup 'lazy' plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)



-- Set <Leader> to <Space> earasing all <Space> bindings
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Turn on line numbers
vim.cmd("set number")

-- Expand <Tab> to spaces
vim.cmd("set expandtab")

-- Set <Tab> width to 4
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")



-- ============
--  LOAD LAZY!
-- ============
-- The order in which the configuration is set up is important!
-- Some commands like setting the <Leader> HAVE to be before
-- setting up 'lazy'. While plugin specific ones like the
-- colorscheme have to be after (for it to get setup by 'lazy').
require("lazy").setup("plugins")



-- Set colorshceme
vim.cmd("colorscheme tokyonight")

-- Keymaps
require('keymaps')

-- LSP setup
require('lsp')
