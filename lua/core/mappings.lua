-- leader key
vim.g.mapleader = "<space>"

-- switching windows
vim.keymap.set("n", "<left>", "<c-w>h")
vim.keymap.set("n", "<Right>", "<C-W>l")
vim.keymap.set("n", "<Up>", "<C-W>k")
vim.keymap.set("n", "<Down>", "<C-W>j")

vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')
