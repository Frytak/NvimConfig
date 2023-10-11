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

require("lazy").setup("plugins")

-- Has to be set up here for execution order reasons... at least for now, mayber there's a better way
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'tsserver', 'rust_analyzer'},
  handlers = {
	lsp_zero.default_setup,
  }
})


-- Set leader
vim.g.mapleaeder = " "

-- Set colorshceme
vim.cmd("colorscheme carbonfox")

-- Line numbers
vim.cmd("set number")

-- Set <Tab> width
vim.cmd("set tabstop=4")



-- The truest statement
print("Gami to furras")
