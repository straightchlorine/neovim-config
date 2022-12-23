local function vimtex_config()
  vim.g.vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
  vim.g.vimtex_view_general_viewer = 'zathura'
end

local function mundo_config()
  vim.g.mundo_width = 50
  vim.g.mundo_preview_height = 20
end

local load_core = function ()
  require'core.packer'

  require'impatient'.enable_profile()

  mundo_config()
  vimtex_config()

  require'core.options'
  require'core.mappings'

  vim.cmd.colorscheme 'oxocarbon'
end

load_core()
