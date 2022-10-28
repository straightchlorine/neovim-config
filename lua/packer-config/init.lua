return require('packer').startup(function(use)
  -- faster lua module loading
  use { 'lewis6991/impatient.nvim',
    config = [[require('impatient')]]
  }

  -- plugin management
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}

  -- lsp pictograms
  use { 'onsails/lspkind-nvim', event = 'VimEnter' }

  -- auto-completion engine
  use { 'hrsh7th/nvim-cmp', after = 'lspkind-nvim', config = [[require('config.nvim-cmp')]] }

  -- nvim-cmp completion sources
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' } }

  -- nvim lsp configuration
  use { 'neovim/nvim-lspconfig', after = 'cmp-nvim-lsp', config = [[require('config.lsp')]] }

  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
      config = [[require('config.lualine')]],
      event = 'VimEnter'
    }
  }

  -- themes
  use "EdenEast/nightfox.nvim"
  vim.cmd('colorscheme carbonfox')

  use { 'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use { 'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate',
   config = [[require('config.treesitter')]]
  }

  -- snippets
  use { 'SirVer/ultisnips', event = 'InsertEnter' }
  use { 'honza/vim-snippets', after = 'ultisnips' }

  use { 'akinsho/bufferline.nvim', event = 'VimEnter',
      config = [[require('config.bufferline')]]
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = [[require('config.indent-blankline')]],
  }

  use { 'itchyny/vim-highlighturl', event = 'VimEnter' }

  use {
    'rcarriga/nvim-notify',
    event = 'BufEnter',
    config = function()
      vim.defer_fn(function()
        require('config.nvim-notify')
      end, 2000)
    end,
  }

  use { 'Raimondi/delimitMate', event = 'InsertEnter' }

  use { 'tpope/vim-commentary', event = 'VimEnter' }

  use { 'simnalamburt/vim-mundo', cmd = { 'MundoToggle', 'MundoShow' } }

  use { 'tpope/vim-eunuch', cmd = { 'Rename', 'Delete' } }
  use { 'nvim-zh/better-escape.vim', event = { 'InsertEnter' } }

  use { 'sbdchd/neoformat', cmd = { 'Neoformat' } }

  use { 'tpope/vim-fugitive', event = 'User InGitRepo', config = [[require('config.fugitive')]] }

  use { 'rbong/vim-flog', requires = 'tpope/vim-fugitive', cmd = { 'Flog' } }

  use { 'christoomey/vim-conflicted', requires = 'tpope/vim-fugitive', cmd = { 'Conflicted' } }

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'User InGitRepo',
    config = [[require('config.git-linker')]],
  }

  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

  use { 'rhysd/committia.vim', opt = true, setup = [[vim.cmd('packadd committia.vim')]] }

  use { 'kevinhwang91/nvim-bqf', ft = 'qf', config = [[require('config.bqf')]] }

  use { 'preservim/vim-markdown', ft = { 'markdown' } }

  use { 'vim-pandoc/vim-markdownfootnotes', ft = { 'markdown' } }

  use { 'godlygeek/tabular', cmd = { 'Tabularize' } }

  use { 'elzr/vim-json', ft = { 'json', 'markdown' } }

  use { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = [[require('config.zen-mode')]] }

  use { 'chrisbra/unicode.vim', event = 'VimEnter' }

  use { 'wellle/targets.vim', event = 'VimEnter' }

  use { 'machakann/vim-sandwich', event = 'VimEnter' }

  use { 'michaeljsmith/vim-indent-object', event = 'VimEnter' }

  use { 'tmux-plugins/vim-tmux', ft = { 'tmux' } }

  use { 'andymass/vim-matchup', event = 'VimEnter' }

  use {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = function()
      vim.defer_fn(function()
        require('config.neoscroll')
      end, 2000)
    end,
  }
  use { 'skywind3000/asyncrun.vim', opt = true, cmd = { 'AsyncRun' } }

  use { 'sakhnik/nvim-gdb', run = { 'bash install.sh' }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] }

  use { 'tpope/vim-obsession', cmd = 'Obsession' }

  use { 'ojroques/vim-oscyank', cmd = { 'OSCYank', 'OSCYankReg' } }

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

  use { 'jdhao/whitespace.nvim', event = 'VimEnter' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim-tree')]],
  }

  use { 'ii14/emmylua-nvim', ft = 'lua' }

  use { 'j-hui/fidget.nvim', after = 'nvim-lspconfig', config = [[require('config.fidget-nvim')]] }

  use { 'lervag/vimtex' }

end)
