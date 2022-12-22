return require('packer').startup(function(use)
  -- plugin managers
  use {'wbthomason/packer.nvim'}

  -- module loader
  use { 'lewis6991/impatient.nvim',
    config = [[require('config.impatient')]]
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate',
   config = [[require('config.treesitter')]]
  }


  use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }
  use { 'j-hui/fidget.nvim', config = [[require('config.fidget-nvim')]] }

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

  use ({ 'hrsh7th/nvim-cmp',
    requires = {
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = [[require('config.cmp-nvim-ultisnips')]],
        requires = { "nvim-treesitter/nvim-treesitter" }
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
    config = [[require('config.nvim-cmp')]] })


  use {'junegunn/fzf', run = function()
      vim.fn['fzf#install']()
  end}



  -- lsp
  use { 'mfussenegger/nvim-jdtls' }
  use { 'mfussenegger/nvim-dap' }
  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
      config = [[require('config.lualine')]],
      event = 'VimEnter'
    }
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

  use { 'mhartington/formatter.nvim' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim-tree')]],
  }
end)
