-- Speedup neovim when using a Lua runtime that supports vim.loader.
-- Some builds use plain Lua 5.1, where load() cannot load strings and
-- vim.loader fails during startup.
if vim.loader and jit then
  vim.loader.enable()
end

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'lsp'
require 'lazy-bootstrap'
