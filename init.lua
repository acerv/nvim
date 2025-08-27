-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'lsp'
require 'lazy-bootstrap'
require 'lazy-plugins'

if vim.loader then
  vim.loader.enable()
end
