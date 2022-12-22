local function load_options()
  local options = {
    backup = false,
    writebackup = false,
    swapfile = false,
    confirm = true,
		shada = "!,'300,<50,@100,s10,h",
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*",

    switchbuf = 'useopen',

		clipboard = 'unnamedplus',

    undofile = true,
		undodir = os.getenv('HOME') .. '/cache/nvim/undo',

		encoding = 'utf-8',

		virtualedit = 'block',

    autoread = 'true',
    autowrite = 'true',
    diffopt = 'filler,iwhite,internal,algorithm:patience',
		updatetime = 100,

    display = 'lastline',
    laststatus = 2,

    equalalways = false,

		viewoptions = 'folds,cursor,curdir',
		sessionoptions = 'curdir,help,tabpages,winsize',

    cmdwinheight = 5,
    cmdheight = 2,
    showcmd = false,
    history = 2000,

    winwidth = 30,
		winminwidth = 10,

		pumheight = 15,
		helpheight = 12,
		previewheight = 12,

    termguicolors = true,
		redrawtime = 1500,
    background = 'dark',

    completeopt = 'menuone,noselect',
    wildmenu = true,
    syntax = true,
    magic = true,
    hidden = true,

    errorbells = true,
    visualbell = true,

    formatoptinos = '1jcroql',

    autoindent = true,
    backspace = 'indent,eol,start',
    shiftround = true,
    smarttab = true,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    softtabstop = 2,
    showtabline = 2,
		smartcase = true,
		infercase = true,

		timeout = true,
		ttimeout = true,
		timeoutlen = 0,
		ttimeoutlen = 0,

    incsearch = true,
		inccommand = "nosplit",
    synmaxcol = 2000,

		complete = ".,w,b,k",

		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",

    ignorecase = true,
    wildignorecase = true,
    wildignore = '.git',

    splitright = true,
    splitbelow = true,

    wrap = false,
		wrapscan = true,
		whichwrap = "h,l,<,>,[,],~",

		breakat = [[\ \	;:,!?]],
    linebreak = true,

    foldenable = 'true',
    foldlevelstart = 99,
    breakindentopt = 'shift:2,min:20',
		startofline = false,

    list = true,
		listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←',
    showbreak = '↳  ',
    shortmess = 'aoOTIcF',
    showmode = true,

    relativenumber = true,
    number = 'true',
    signcolumn = 'yes',
    cursorline = true,
    cursorcolumn = true,
    ruler = true,
    jumpoptions = 'stack',

    scrolloff = 2,
		sidescrolloff = 5,
		mousescroll = 'ver:3,hor:6',

    conceallevel = 0,
    concealcursor = 'niv',
  }

  for k, v in pairs(options) do
    vim.o[k] = v
  end
end

load_options()
