local conf = require'config'

return require'packer'.startup(function (use)
  use { 'wbthomason/packer.nvim'}

  use { 'lewis6991/impatient.nvim',
   config = conf.impatient,
  }

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
      { 'amarakon/nvim-cmp-buffer-lines' },
      { 'kyazdani42/nvim-web-devicons',  },
      { 'hrsh7th/cmp-nvim-lsp'           },
      { 'hrsh7th/cmp-buffer'             },
      { 'hrsh7th/cmp-calc'               },
      { 'uga-rosa/cmp-dictionary'        },
      { 'hrsh7th/cmp-path'               },
      { 'hrsh7th/cmp-cmdline'            },
      { 'hrsh7th/cmp-omni'               },
      { 'hrsh7th/cmp-nvim-lua'           },
      { 'f3fora/cmp-spell'               },
      { 'onsails/lspkind-nvim'           },
    },
    config = conf.nvim_cmp }

  use { 'neovim/nvim-lspconfig',
    config = conf.lsp
  }

end)
