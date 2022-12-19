vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.syntax = 'enable'
vim.opt.wildmenu = true

vim.opt.background = 'dark'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.fileencoding = 'utf-8'
vim.opt.termguicolors = true

vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.hidden = true
vim.opt.background = 'dark'

vim.opt.conceallevel = 0
vim.g.vimtex_view_general_viewer = 'zathura'
vim.cmd [[ let g:vimtex_compiler_latexmk = { 'options' : [ '-shell-escape' ] }]]
