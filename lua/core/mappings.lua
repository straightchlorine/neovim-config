local map = vim.keymap

vim.g.mapleader = "<space>"

-- Switch windows
map.set("n", "<left>", "<c-w>h")
map.set("n", "<Right>", "<C-W>l")
map.set("n", "<Up>", "<C-W>k")
map.set("n", "<Down>", "<C-W>j")

map.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')
