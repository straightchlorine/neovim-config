-- general configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,

  auto_install = true,
  incremental_selection = { enable = true },
  textobjects = { enable = true },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  indent = {
    enable = true,
  },
}

-- adding s-expression parser
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.sexp = {
  install_info = {
    url = "~/.local/parsers/tree-sitter-sexp",
    files = {"src/parser.c"},
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = ".yuck",
}
