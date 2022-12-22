local conf = {}

conf.impatient = function() require'config.impatient' end
conf.treesitter = function() require'config.treesitter' end
conf.cmp_nvim_ultisnips = function() require'config.cmp-nvim-ultisnips' end
conf.nvim_cmp = function() require'config.nvim-cmp' end
conf.lsp = function() require'config.lsp' end

return conf
