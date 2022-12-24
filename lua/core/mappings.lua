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
map('n', '<leader>vs', ':vsplit<cr>', options)
map('n', '<leader>hs', ':split<cr>', options)

-- searching
map( 'n', '<leader><esc>', ':nohlsearch<cr>', options)

-- Fugitive bindings
map( 'n', '<leader>gg', ':Git<cr>', options)
map( 'n', '<leader>ga', ':Gwrite<cr>', options)
map( 'n', '<leader>gc', ':Git commit<cr>', options)
map( 'n', '<leader>gp', ':Git push<cr>', options)

-- Telescope bindings
map( 'n', '<leader>b', ':Telescope buffers<cr>', options)
map( 'n', '<leader>f', ':Telescope find_files<cr>', options)

-- fzf bindings
map( 'n', '<leader>gf', ':GitFZF<cr>', options)
map( 'n', '<leader>zf', ':DirFZF<cr>', options)

-- undo
map( 'n', '<F5>', ':MundoToggle<cr>', options)

-- nvim tree
map( 'n', '<leader>n', ':NvimTreeToggle<cr>', options)

-- bufferline
map( 'n', '<leader>[c', ':BufferLineCycleNext<cr>', options)
map( 'n', '<leader>c]', ':BufferLineCyclePrev<cr>', options)

map( 'n', '<leader>[m', ':BufferLineMoveNext<cr>', options)
map( 'n', '<leader>m]', ':BufferLineMovePrev<cr>', options)

map( 'n', '<leader>be', ':BufferLineSortByExtension<cr>', options)
map( 'n', '<leader>bd', ':BufferLineSortByDirectory<cr>', options)


