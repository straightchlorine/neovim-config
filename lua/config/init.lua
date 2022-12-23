local conf = {}

  conf.impatient = function() require'config.impatient' end
  conf.treesitter = function() require'config.treesitter' end
  conf.cmp_nvim_ultisnips = function() require'config.cmp-nvim-ultisnips' end
  conf.nvim_cmp = function() require'config.nvim-cmp' end
  conf.lsp = function() require'config.lsp' end
  conf.bqf = function() require'config.bqf' end
  conf.fidget = function() require'fidget-nvim' end
  conf.lualine = function() require'lualine' end
  conf.bufferline = function() require'bufferline' end
  conf.fugitive = function() require'fugitive' end
  conf.gitsigns = function() require'gitsigns' end
  conf.zen = function() require'zen-mode' end
  conf.tree = function() require'nvim-tree' end
  conf.notify = function() require'nvim-notify' end
  conf.scroll = function() require'neoscroll' end

return conf
