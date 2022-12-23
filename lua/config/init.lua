local conf = {}

  conf.impatient = function() require'config.impatient' end
  conf.treesitter = function() require'config.treesitter' end
  conf.cmp_nvim_ultisnips = function() require'config.cmp-nvim-ultisnips' end
  conf.nvim_cmp = function() require'config.nvim-cmp' end
  conf.lsp = function() require'config.lsp' end
  conf.notify = function() require'config.nvim-notify' end
  conf.fidget = function() require'config.fidget-nvim' end
  conf.tree = function() require'config.nvim-tree' end
  conf.lualine = function() require'config.lualine' end
  conf.bufferline = function() require'config.bufferline' end
  conf.zen = function() require'config.zen-mode' end
  conf.scroll = function() require'config.neoscroll' end
  conf.bqf = function() require'config.bqf' end
  conf.fugitive = function() require'config.fugitive' end
  conf.gitsigns = function() require'config.gitsigns' end

return conf
