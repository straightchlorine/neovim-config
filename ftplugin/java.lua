-- local config = {
--
--
--     settings = {
--       java = {
--         signatureHelp = { enabled = true };
--       }
--     },
--
--     init_options = {
--       bundles = {
--         vim.fn.glob(os.getenv("HOME") .. "/.local/debug/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
--         vim.split(vim.fn.glob("/home/zweiss/.local/debug/vscode-java-test/server/*.jar"), "\n")
--       }
--     },
--
--     flags = {
--       allow_incremental_sync = true
--     },
--
--     capabilities = {
--       workspace = {
--           configuration = true
--       },
--       textDocument = {
--           completion = {
--               completionItem = {
--                   snippetSupport = true
--               }
--           }
--       }
--     },
--
--     on_attach = function(client, bufnr)
--       require'jdtls.setup'.add_commands()
--       require'jdtls'.setup_dap()
--       require'lsp-status'.register_progress()
--       require'lspkind'.init()
--       require'lspsaga'.init_lsp_saga()
--       require'formatter'.setup {
--         filetype = {
--           java = {
--             function()
--               return {
--                 exe = 'java',
--                 args = { '-jar', os.getenv('HOME') .. '/.local/jars/google-java-format.jar', vim.api.nvim_buf_get_name(0) },
--                 stdin = true
--               }
--             end
--           }
--         }
--       }
--
--     vim.api.nvim_exec([[
--       augroup FormatAutogroup
--         autocmd!
--         autocmd BufWritePost *.java FormatWrite
--       augroup end
--     ]], true)
--
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--     local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--     buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--     -- Mappings.
--     local opts = { noremap=true, silent=true }
--     buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--     buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--     buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--     buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--     buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--     buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--     buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
--     buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--     buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--     buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--     buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--     -- Java specific
--     buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
--     buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
--     buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
--     buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
--     buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
--     buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
--
--     buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--
--     vim.api.nvim_exec([[
--         hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--         hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--         hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--         augroup lsp_document_highlight
--           autocmd!
--           autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--           autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--         augroup END
--     ]], false)
--
--   end,
-- }
--
--
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_directory = os.getenv("HOME") .. '/coding/workspace-root' .. project
local jdtls_path = os.getenv("HOME") .. '/.local/jdtls/org.eclipse.jdt.ls.product/target/repository'
local config = {
  cmd = {
    '/usr/lib/jvm/java-19-openjdk/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', jdtls_path .. '/config_linux',
    '-data', workspace_directory
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

settings = {
    java = {
    }
  },

init_options = {
    bundles = {}
  },


}
require('jdtls').start_or_attach(config)
