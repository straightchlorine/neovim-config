return require'packer'.startup(function (use)
  -- plugin manager
  use {'wbthomason/packer.nvim'}

  use {'lewis6991/impatient.nvim',
    config = [[require('config.impatient')]]
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('config.treesitter')]]
  }

end)
