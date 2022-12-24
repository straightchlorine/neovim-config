local map = vim.api.nvim_set_keymap

-- leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true }

-- switching windows
map('n', '<left>', '<c-w>h', options)
map('n', '<right>', '<c-w>l', options)
map('n', '<up>', '<c-w>k', options)
map('n', '<down>', '<c-w>j', options)

-- splitting the buffer
map('n', '<leader>vs', ':vsplit', options)
map('n', '<leader>hs', ':split', options)

map( 'n', '<leader><esc>', ':nohlsearch<cr>', options)
map( 'n', '<C-n>', ':NvimTreeToggle<cr>', options)
map( 'n', '<leader>gg', ':Git<cr>', options)

-- Fugitive bindings
map( 'n', '<leader>ga', ':Gwrite<cr>', options)
map( 'n', '<leader>gp', ':Git push<cr>', options)
map( 'n', '<leader>gc', ':Git commit<cr>', options)

-- Telescope bindings
map( 'n', '<leader>p', ':Telescope project<cr>', options)
map( 'n', '<leader>b', ':Telescope buffers<cr>', options)
map( 'n', '<leader>f', ':Telescope find_files<cr>', options)

-- fzf bindings
map( 'n', '<leader>gf', ':GitFZF<cr>', options)
map( 'n', '<leader>ff', ':DirFZF<cr>', options)
