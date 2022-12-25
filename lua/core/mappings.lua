local map = vim.api.nvim_set_keymap

-- leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }

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

-- ultisnips
map( 'n', '<leader>ur', '<cmd>:call UltiSnips#RefreshSnippets()<cr> <esc> <cmd>:CmpUltisnipsReloadSnippets <cr>', options)

-- undo
map( 'n', '<F5>', ':MundoToggle<cr>', options)

-- kommentary
map("n", "<leader>/", "<plug>kommentary_line_default", {})
map("v", "<leader>/", "<plug>kommentary_visual_default", {})

-- nvim tree
map( 'n', '<leader>n', ':NvimTreeToggle<cr>', options)
map( 'n', '<leader>nf', ':NvimTreeFindFile<cr>', options)
map( 'n', '<leader>nr', ':NvimTreeRefrech<cr>', options)

-- bufferline
map( 'n', '<leader>[c', ':BufferLineCycleNext<cr>', options)
map( 'n', '<leader>c]', ':BufferLineCyclePrev<cr>', options)

map( 'n', '<leader>[m', ':BufferLineMoveNext<cr>', options)
map( 'n', '<leader>m]', ':BufferLineMovePrev<cr>', options)

map( 'n', '<leader>be', ':BufferLineSortByExtension<cr>', options)
map( 'n', '<leader>bd', ':BufferLineSortByDirectory<cr>', options)

map( 'n', '<leader>bd', ':BufferLinePickClose<cr>', options)

-- dap
map( 'n', '<leader>dd', ':lua require"dap".terminate() require"dapui".close()<cr>', options)

map( 'n', '<F9>', ':lua require"dap".continue()<cr>', options)
map( 'n', '<leader>dr', ':lua require"dap".continue()<cr>', options)

map( 'n', '<leader>b', ':lua require"dap".toggle_breakpoint()<cr>', options)
map( 'n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', options)
map( 'n', '<leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', options)
map( 'n', '<leader>dbl', ':lua require"dap".list_breakpoints()<cr>', options)
map( 'n', '<leader>drc', ':lua require"dap".run_to_cursor()<cr>', options)
map( 'n', '<leader>drl', ':lua require"dap".run_last()<cr>', options)

map( 'n', '<F-9>', ':lua require"dap".step_over()<cr>', options)
map( 'n', '<leader>dv', ':lua require"dap".step_over()<cr>', options)
map( 'n', '<F-10>', ':lua require"dap".step_into()<cr>', options)
map( 'n', '<leader>di', ':lua require"dap".step_into()<cr>', options)
map( 'n', '<F-11>', ':lua require"dap".step_out()<cr>', options)
map( 'n', '<leader>do', ':lua require"dap".step_out()<cr>', options)

map( 'n', '<leader>dr', ':lua require"dap".repl.open()<cr>', options)
map( 'o', 'm', ':lua require"tsht".nodes()', options)
