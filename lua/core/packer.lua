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

  use { 'rcarriga/nvim-notify' }

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
      { 'amarakon/nvim-cmp-buffer-lines',},
      { 'kyazdani42/nvim-web-devicons',  },
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

  use { 'neovim/nvim-lspconfig',
    config = conf.lsp
  }

end)
