return require'packer'.startup(function (use)
  -- plugin manager
  use {'wbthomason/packer.nvim'}

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('config.treesitter')]]
  }

end)
