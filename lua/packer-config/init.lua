return require('packer').startup(function(use)
  -- module loader
  use { 'lewis6991/impatient.nvim',
    config = [[require('config.impatient')]]
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate',
   config = [[require('config.treesitter')]]
  }

  -- plugin managers
  use {'wbthomason/packer.nvim'}
  use {'neoclide/coc.nvim', branch = 'release', config=[[require('config.coc')]]}

  use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }
  use { 'j-hui/fidget.nvim', config = [[require('config.fidget-nvim')]] }
  use({ 'glepnir/lspsaga.nvim',
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
  })

  use ({ 'hrsh7th/nvim-cmp',
    requires = {
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = [[require('config.cmp-nvim-ultisnips')]],
        requires = { "nvim-treesitter/nvim-treesitter" }
      },
      { 'amarakon/nvim-cmp-buffer-lines' },
      { 'hrsh7th/cmp-nvim-lsp'           },
      { 'hrsh7th/cmp-buffer'             },
      { 'hrsh7th/cmp-calc'               },
      { 'uga-rosa/cmp-dictionary'        },
      { 'hrsh7th/cmp-path'               },
      { 'hrsh7th/cmp-cmdline'            },
      { 'hrsh7th/cmp-omni'               },
      { 'hrsh7th/cmp-nvim-lua'           },
      { 'f3fora/cmp-spell'               },
    },
    config = [[require('config.nvim-cmp')]] })


  -- snippets
  use { 'SirVer/ultisnips' }
  use { 'honza/vim-snippets' }

  -- autocompletion & sources
  use { 'onsails/lspkind-nvim', event = 'VimEnter' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf', config = [[require('config.bqf')]] }

  use { 'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use {'junegunn/fzf', run = function()
      vim.fn['fzf#install']()
  end}



  -- lsp
  use { 'mfussenegger/nvim-jdtls' }
  use { 'mfussenegger/nvim-dap' }
  use { 'lervag/vimtex' }
  use { 'ii14/emmylua-nvim', ft = 'lua' }

  use { 'gelguy/wilder.nvim', opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }

  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
      config = [[require('config.lualine')]],
      event = 'VimEnter'
    }
  }

  use { 'akinsho/bufferline.nvim', event = 'VimEnter',
      config = [[require('config.bufferline')]]
  }

  -- themes
  use "EdenEast/nightfox.nvim"
  vim.cmd('colorscheme carbonfox')

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = [[require('config.indent-blankline')]],
  }

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
  use { 'tpope/vim-fugitive', event = 'User InGitRepo', config = [[require('config.fugitive')]] }
  use { 'rbong/vim-flog', requires = 'tpope/vim-fugitive', cmd = { 'Flog' } }
  use { 'christoomey/vim-conflicted', requires = 'tpope/vim-fugitive', cmd = { 'Conflicted' } }

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'User InGitRepo',
    config = [[require('config.git-linker')]],
  }

  use { 'simnalamburt/vim-mundo', cmd = { 'MundoToggle', 'MundoShow' } }

  use { 'tpope/vim-eunuch', cmd = { 'Rename', 'Delete' } }


  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

  use { 'rhysd/committia.vim', opt = true, setup = [[vim.cmd('packadd committia.vim')]] }


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

  use { 'mhartington/formatter.nvim' }

  use {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = function()
      require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                      '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,       -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,             -- Function to run after the scrolling animation ends
          performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
    end,
  }
  use { 'skywind3000/asyncrun.vim', opt = true, cmd = { 'AsyncRun' } }

  use { 'tpope/vim-obsession', cmd = 'Obsession' }

  use { 'ojroques/vim-oscyank', cmd = { 'OSCYank', 'OSCYankReg' } }

  use { 'jdhao/whitespace.nvim', event = 'VimEnter' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim-tree')]],
  }
end)
