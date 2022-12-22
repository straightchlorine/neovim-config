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

  flags = {
    allow_incremental_sync = true
  },

  -- TODO: should check out other things, maybe something interesting

  settings = {
    java = {
      signatureHelp = { enabled = true };
    }
  },

  init_options = {
    bundles = {}
  },

  on_attach = function(client, bufnr)
    require'jdtls.setup'.add_commands()
    require'lspkind'.init()
    require'lspsaga'.init_lsp_saga()
    require'formatter'.setup {
      logging = true,
      filetype = {
        java = {
          function()
            return {
              exe = 'java',
              args = {
                '-jar',
                vim.fn.glob('~/.local/jars/google-java-format-1.15.0-all-deps.jar'),
                vim.api.nvim_buf_get_name(0)
              },
              stdin = true
            }
          end
        }
      }
    }
    -- TODO: try to make it look prettier, and expandable, some kind of loop maybe
    local bundles = {
      -- java-debug
      vim.fn.glob("/home/zweiss/.local/debug/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
    };

    -- vscode-java-test
    vim.list_extend(bundles, vim.split(vim.fn.glob("/home/zweiss/.local/debug/vscode-java-test/server/*.jar", 1), "\n"))

    config['init_options'] = {
      bundles = bundles;
    }
    -- format after save (according to google java format)
    vim.api.nvim_exec([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.java FormatWrite
      augroup end]], true)

    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)

    require'jdtls'.setup_dap({hotcodereplace = 'auto'})
  end,
}
require('jdtls').start_or_attach(config)
