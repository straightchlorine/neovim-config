local conf = require'config'

return require'packer'.startup(function (use)
  use { 'wbthomason/packer.nvim'}

  use { 'lewis6991/impatient.nvim',
   config = conf.impatient,
  }

  use { 'nvim-lua/plenary.nvim' }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = conf.treesitter,
  }

  use {'nyoom-engineering/oxocarbon.nvim'}

  use { 'hrsh7th/nvim-cmp',
    requires = {
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = conf.cmp_nvim_ultisnips,
        requires = { 'nvim-treesitter/nvim-treesitter' }
      },
      {
        'petertriho/cmp-git',
        requires = "nvim-lua/plenary.nvim"
      },
      { 'amarakon/nvim-cmp-buffer-lines' },
      { 'kyazdani42/nvim-web-devicons'   },
      { 'hrsh7th/cmp-nvim-lsp'           },
      { 'hrsh7th/cmp-buffer'             },
      { 'hrsh7th/cmp-calc'               },
      { 'uga-rosa/cmp-dictionary'        },
      { 'hrsh7th/cmp-path'               },
      { 'hrsh7th/cmp-nvim-lsp-signature-help'},
      { 'hrsh7th/cmp-cmdline'            },
      { 'hrsh7th/cmp-omni'               },
      { 'hrsh7th/cmp-emoji'              },
      { 'hrsh7th/cmp-nvim-lua'           },
      { 'f3fora/cmp-spell'               },
      { 'onsails/lspkind-nvim'           },
      { 'dmitmel/cmp-digraphs'           },
    },
    config = conf.nvim_cmp }

  use { 'neovim/nvim-lspconfig',
    config = conf.lsp
  }

  -- ui notifications
  use { 'rcarriga/nvim-notify',
    config = conf.notify
  }

  -- ui lsp processes
  use { 'j-hui/fidget.nvim',
    config = conf.fidget
  }

  -- nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = conf.tree,
    tag = 'nightly'
  }

  -- statusline
  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
      event = 'VimEnter'
    },
    config = conf.lualine,
  }

  -- buffer management
  use { 'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = conf.bufferline
  }

  -- zen
  use { 'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = conf.zen
  }

  -- smooth scrolling
  use { 'karb94/neoscroll.nvim',
    config = conf.scroll,
  }

  -- quickfix
  use { 'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = conf.bqf
  }

  use { 'skywind3000/asyncrun.vim',
    opt = true,
    cmd = { 'AsyncRun' }
  }

  use {'SirVer/ultisnips',
      requires = {{'honza/vim-snippets', rtp = '.'}},
      config = function()
        vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
        vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
        vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
        vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end
  }

  -- file finding
  use { 'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {'junegunn/fzf', run = function()
      vim.fn['fzf#install']()
  end}

  -- writing
  use { 'tpope/vim-commentary' }

  use { 'tpope/vim-obsession' }

  use { 'tpope/vim-eunuch' }

  use { 'Raimondi/delimitMate' }

  use { 'lukas-reineke/indent-blankline.nvim' }

  use { 'simnalamburt/vim-mundo' }

  use { 'godlygeek/tabular' }

  use { 'chrisbra/unicode.vim' }

  use { 'wellle/targets.vim' }

  use { 'machakann/vim-sandwich' }

  use { 'michaeljsmith/vim-indent-object' }

  use { 'andymass/vim-matchup' }

  use { 'ojroques/vim-oscyank',
    branch = 'main'
  }

  -- git integration
  use { 'tpope/vim-fugitive',
    config = conf.fugitive
  }

  use { 'rbong/vim-flog',
    requires = 'tpope/vim-fugitive',
    cmd = { 'Flog' }
  }

  use { 'lewis6991/gitsigns.nvim',
    config = conf.gitsigns
  }

  use { 'rhysd/committia.vim',
    opt = true,
    setup = [[vim.cmd('packadd committia.vim')]]
  }
  -- TODO: add something to deal with conflicts

  -- java
  use { 'mfussenegger/nvim-jdtls',
    ft = { 'java' }
  }

  use { 'mfussenegger/nvim-dap',
    ft = { 'java' }
  }

  -- lua
  use { 'ii14/emmylua-nvim',
    ft = { 'lua' }
  }

  -- LaTeX
  use { 'lervag/vimtex',
    ft = { 'latex' }
  }

  -- markdown
  use { 'preservim/vim-markdown',
    ft = { 'markdown' }
  }

  use { 'vim-pandoc/vim-markdownfootnotes',
    ft = { 'markdown' }
  }

  -- JSON
  use { 'elzr/vim-json',
    ft = { 'json', 'markdown' }
  }

  -- tmux
  use { 'tmux-plugins/vim-tmux',
    ft = { 'tmux' }
  }

  -- formatter
  -- TODO: think how to deal with multiple types ft or something else
  use { 'mhartington/formatter.nvim' }

end)
