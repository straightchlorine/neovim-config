-- local keymap = vim.keymap
-- local helpers = require'helpers'
-- local api = vim.api
-- local lsp = vim.lsp
-- local fn = vim.fn
--
-- local on_attach = function(client, bufnr)
--
--   local map = function(mode, bind, action, options)
--     options = options or {}
--     options.silent = true
--     options.buffer = bufnr
--     keymap.set(mode, bind, action, options)
--   end
--
--   -- vim.lsp
--   --map('n', 'gd', vim.lsp.buf.definition, { desc = '[g]et [d]efinition' })
--   map('n', 'gr', vim.lsp.buf.references, { desc = '[g]et [d]references' })
--
--   map('n', '<C-k>', vim.lsp.buf.signature_help)
--   map('n', 'K', vim.lsp.buf.hover)
--   map('n', '<space>rn', vim.lsp.buf.rename, { desc = '[r]ename [v]ariable' })
--   map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'lsp [c]ode [a]ction' })
--
--   map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = '[w]orkspace [a]add' })
--   map('n', '<space>wa', vim.lsp.buf.remove_workspace_folder, { desc = '[w]orkspace [r]emove' })
--   map('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, { desc = '[w]orkspace [l]ist'})
--
--   -- vim.diagnostics
--   map('n', '[d', vim.diagnostic.goto_prev, { desc = 'previous [d]iagnostic' })
--   map('n', 'd]', vim.diagnostic.goto_next, { desc = 'next [d]iagnostic' })
--
--   api.nvim_create_autocmd("CursorHold", {
--     buffer = bufnr,
--     callback = function()
--       local float_opts = {
--         focusable = false,
--         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--         border = "rounded",
--         source = "always", -- show source in diagnostic popup window
--         prefix = " ",
--       }
--
--       if not vim.b.diagnostics_pos then
--         vim.b.diagnostics_pos = { nil, nil }
--       end
--
--       local cursor_pos = api.nvim_win_get_cursor(0)
--       if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
--           and #vim.diagnostic.get() > 0
--       then
--         vim.diagnostic.open_float(nil, float_opts)
--       end
--
--       vim.b.diagnostics_pos = cursor_pos
--     end,
--   })
--
--   if client.server_capabilities.documentHighlightProvider then
--     vim.cmd([[
--       hi! link LspReferenceRead Visual
--       hi! link LspReferenceText Visual
--       hi! link LspReferenceWrite Visual
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]])
--   end
--
--   if vim.g.logging_level == "debug" then
--     local msg = string.format("Language server %s started!", client.name)
--     vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
--   end
--
-- end
--
-- --capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- local lspconfig = require("lspconfig")
--
-- if helpers.executable("pylsp") then
--   lspconfig.pylsp.setup {
--     on_attach = on_attach,
--     settings = {
--       pylsp = {
--         plugins = {
--           pylint = { enabled = true, executable = "pylint" },
--           pyflakes = { enabled = false },
--           pycodestyle = { enabled = false },
--           jedi_completion = { fuzzy = true },
--           pyls_isort = { enabled = true },
--           pylsp_mypy = { enabled = true },
--         },
--       },
--     },
--     flags = {
--       debounce_text_changes = 200,
--     },
--     capabilities = capabilities,
--   }
-- else
--   vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
-- end
--
-- if helpers.executable("clangd") then
--   lspconfig.clangd.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "c", "cpp", "cc" },
--     flags = {
--       debounce_text_changes = 500,
--     },
--   }
-- else
--   vim.notify("clangd not found!", vim.log.levels.WARN, { title = "Nvim-config" })
-- end
--
-- if helpers.executable("vim-language-server") then
--   lspconfig.vimls.setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 500,
--     },
--     capabilities = capabilities,
--   }
-- else
--   vim.notify("vim-language-server not found!", vim.log.levels.WARN, { title = "Nvim-config" })
-- end
--
-- if helpers.executable("bash-language-server") then
--   lspconfig.bashls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- if helpers.executable("lua-language-server") then
--   lspconfig.sumneko_lua.setup {
--     on_attach = on_attach,
--     settings = {
--       Lua = {
--         runtime = {
--           version = "LuaJIT",
--         },
--         diagnostics = {
--           globals = { "vim" },
--         },
--         workspace = {
--           library = {
--             fn.stdpath("data") .. "/site/pack/packer/opt/emmylua-nvim",
--             fn.stdpath("config"),
--           },
--           maxPreload = 2000,
--           preloadFileSize = 50000,
--         },
--       },
--     },
--     capabilities = capabilities,
--   }
-- end
--
--

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
--  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--  -- Mappings.
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  local bufopts = { noremap=true, silent=true, buffer=bufnr }
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, bufopts)
--  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

--   api.nvim_create_autocmd("CursorHold", {
--     buffer = bufnr,
--     callback = function()
--       local float_opts = {
--         focusable = false,
--         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--         border = "rounded",
--         source = "always", -- show source in diagnostic popup window
--         prefix = " ",
--       }
--
--       if not vim.b.diagnostics_pos then
--         vim.b.diagnostics_pos = { nil, nil }
--       end
--
--       local cursor_pos = api.nvim_win_get_cursor(0)
--       if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
--           and #vim.diagnostic.get() > 0
--       then
--         vim.diagnostic.open_float(nil, float_opts)
--       end
--
--       vim.b.diagnostics_pos = cursor_pos
--     end,
--   })
--
--   if client.server_capabilities.documentHighlightProvider then
--     vim.cmd([[
--       hi! link LspReferenceRead Visual
--       hi! link LspReferenceText Visual
--       hi! link LspReferenceWrite Visual
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]])
--   end
--
--   if vim.g.logging_level == "debug" then
--     local msg = string.format("Language server %s started!", client.name)
--     vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
--   end

 end
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

local lspconfig = require'lspconfig'
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
'force',
lsp_defaults.capabilities,
require'cmp_nvim_lsp'.default_capabilities()
)

capabilities.textDocument.completion.completionItem.snippetSupport = true

