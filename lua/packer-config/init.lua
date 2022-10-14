return require('packer').startup(function(use)
  use { 'lewis6991/impatient.nvim',
    config = [[require('impatient')]]
  }

  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}

  use { 'onsails/lspkind-nvim', event = 'VimEnter' }
  -- auto-completion engine
  use { 'hrsh7th/nvim-cmp', after = 'lspkind-nvim', config = [[require('config.nvim-cmp')]] }

  -- nvim-cmp completion sources
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' } }

  -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
  use { 'neovim/nvim-lspconfig', after = 'cmp-nvim-lsp', config = [[require('config.lsp')]] }

  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
      config = [[require('config.lualine')]],
      event = 'VimEnter'
    }
  }

  use { 'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use { 'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate',
   config = [[require('config.treesitter')]]
  }

  use { 'SirVer/ultisnips', event = 'InsertEnter' }
  use { 'honza/vim-snippets', after = 'ultisnips' }

  use { 'akinsho/bufferline.nvim', event = 'VimEnter',
      cond = firenvim_not_active,
      config = [[require('config.bufferline')]]
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = [[require('config.indent-blankline')]],
  }

  -- Highlight URLs inside vim
  use { 'itchyny/vim-highlighturl', event = 'VimEnter' }

  -- notification plugin
  use {
    'rcarriga/nvim-notify',
    event = 'BufEnter',
    config = function()
      vim.defer_fn(function()
        require('config.nvim-notify')
      end, 2000)
    end,
  }

  -- Automatic insertion and deletion of a pair of characters
  use { 'Raimondi/delimitMate', event = 'InsertEnter' }

  -- Comment plugin
  use { 'tpope/vim-commentary', event = 'VimEnter' }

  -- Show undo history visually
  use { 'simnalamburt/vim-mundo', cmd = { 'MundoToggle', 'MundoShow' } }

  -- Handy unix command inside Vim (Rename, Move etc.)
  use { 'tpope/vim-eunuch', cmd = { 'Rename', 'Delete' } }
  
  use { 'nvim-zh/better-escape.vim', event = { 'InsertEnter' } }

  -- Auto format tools
  use { 'sbdchd/neoformat', cmd = { 'Neoformat' } }

  -- Git command inside vim
  use { 'tpope/vim-fugitive', event = 'User InGitRepo', config = [[require('config.fugitive')]] }

  -- Better git log display
  use { 'rbong/vim-flog', requires = 'tpope/vim-fugitive', cmd = { 'Flog' } }

  use { 'christoomey/vim-conflicted', requires = 'tpope/vim-fugitive', cmd = { 'Conflicted' } }

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'User InGitRepo',
    config = [[require('config.git-linker')]],
  }

  -- Show git change (change, delete, add) signs in vim sign column
  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

  -- Better git commit experience
  use { 'rhysd/committia.vim', opt = true, setup = [[vim.cmd('packadd committia.vim')]] }

  use { 'kevinhwang91/nvim-bqf', ft = 'qf', config = [[require('config.bqf')]] }

  -- Another markdown plugin
  use { 'preservim/vim-markdown', ft = { 'markdown' } }

  -- Faster footnote generation
  use { 'vim-pandoc/vim-markdownfootnotes', ft = { 'markdown' } }

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { 'godlygeek/tabular', cmd = { 'Tabularize' } }

  -- Markdown JSON header highlight plugin
  use { 'elzr/vim-json', ft = { 'json', 'markdown' } }

  use { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = [[require('config.zen-mode')]] }

  use { 'chrisbra/unicode.vim', event = 'VimEnter' }

  -- Additional powerful text object for vim, this plugin should be studied
  -- carefully to use its full power
  use { 'wellle/targets.vim', event = 'VimEnter' }

  -- Plugin to manipulate character pairs quickly
  use { 'machakann/vim-sandwich', event = 'VimEnter' }

  -- Add indent object for vim (useful for languages like Python)
  use { 'michaeljsmith/vim-indent-object', event = 'VimEnter' }

  use { 'tmux-plugins/vim-tmux', ft = { 'tmux' } }

    -- Modern matchit implementation
  use { 'andymass/vim-matchup', event = 'VimEnter' }

  -- Smoothie motions
  use {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = function()
      vim.defer_fn(function()
        require('config.neoscroll')
      end, 2000)
    end,
  }
  -- Asynchronous command execution
  use { 'skywind3000/asyncrun.vim', opt = true, cmd = { 'AsyncRun' } }

  use { 'sakhnik/nvim-gdb', run = { 'bash install.sh' }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] }



  -- Session management plugin
  use { 'tpope/vim-obsession', cmd = 'Obsession' }

  use { 'ojroques/vim-oscyank', cmd = { 'OSCYank', 'OSCYankReg' } }

  -- The missing auto-completion for cmdline!
  use { 'gelguy/wilder.nvim', opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }

  use {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = function()
          vim.defer_fn(function()
            require('config.which-key')
          end, 2000)
        end,
      }

  -- show and trim trailing whitespaces
  use { 'jdhao/whitespace.nvim', event = 'VimEnter' }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim-tree')]],
  }


   use { 'ii14/emmylua-nvim', ft = 'lua' }

  use { 'j-hui/fidget.nvim', after = 'nvim-lspconfig', config = [[require('config.fidget-nvim')]] } 
    use { 'lervag/vimtex' }
  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- -- Lazy loading:
  -- -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- -- Load on a combination of conditions: specific filetypes or commands
  -- -- Also run code after load (see the 'config' key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)
