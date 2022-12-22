local config = require'config'

return require'packer'.startup(function (use)
  use {'wbthomason/packer.nvim'}

  use {'lewis6991/impatient.nvim',
    config = config.impatient
  }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = config.impatient
  }

  use { 'neovim/nvim-lspconfig',
    config = config.lsp
  }

end)
