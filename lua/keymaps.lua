-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Save numbered vertical motions such as "80j" inside the jumplist
-- In this way it's possible to move between jumps with CTRL+o and CTRL+i
vim.keymap.set({ 'n', 'x' }, 'j', function()
  return vim.v.count > 1 and "m'" .. vim.v.count .. 'j' or 'j'
end, { noremap = true, expr = true })

vim.keymap.set({ 'n', 'x' }, 'k', function()
  return vim.v.count > 1 and "m'" .. vim.v.count .. 'k' or 'k'
end, { noremap = true, expr = true })

-- Move fast and centered in the screen
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up and centered' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down and centered' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
