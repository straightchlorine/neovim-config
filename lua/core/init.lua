-- local function vimtex_config = function()
--   vim.api.nvim_set_option_value('vimtex_compiler_latexmk.options', '-shell-escape')
--   vim.g.vimtex_view_general_viewer = 'zathura'
-- end
--

local load_core = function ()
  require'core.packer'

  --require'impatient'.enable_probile()

  require'core.options'
  require'core.mappings'

  vim.cmd.colorscheme 'oxocarbon'
end

load_core()
