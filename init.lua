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
