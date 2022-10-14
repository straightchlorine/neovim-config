local keymap = vim.keymap
local helpers = require'helpers'
local api = vim.api
local lsp = vim.lsp
local fn = vim.fn

local on_attach = function(client, bufnr)

  local map = function(mode, bind, action, options)
    options = options or {}
    options.silent = true
    options.buffer = bufnr
    keymap.set(mode, bind, action, options)
  end

  -- vim.lsp
  map('n', 'gd', vim.lsp.buf.definition, { desc = '[g]et [d]efinition' })
  map('n', 'gr', vim.lsp.buf.references, { desc = '[g]et [d]references' })

  map('n', '<C-k>', vim.lsp.buf.signature_help)
  map('n', 'K', vim.lsp.buf.hover)
  map('n', '<space>rn', vim.lsp.buf.rename, { desc = '[r]ename [v]ariable' })
  map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'lsp [c]ode [a]ction' })

  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = '[w]orkspace [a]add' })
  map('n', '<space>wa', vim.lsp.buf.remove_workspace_folder, { desc = '[w]orkspace [r]emove' })
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = '[w]orkspace [l]ist'})

  -- vim.diagnostics
  map('n', '[d', vim.diagnostic.goto_prev, { desc = 'previous [d]iagnostic' })
  map('n', 'd]', vim.diagnostic.goto_next, { desc = 'next [d]iagnostic' })


  api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always", -- show source in diagnostic popup window
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = api.nvim_win_get_cursor(0)
      if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
          and #vim.diagnostic.get() > 0
      then
        vim.diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

  if vim.g.logging_level == "debug" then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
  end
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

if helpers.executable("pylsp") then
  lspconfig.pylsp.setup {
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = true, executable = "pylint" },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
  }
else
  vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

if helpers.executable("clangd") then
  lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "cc" },
    flags = {
      debounce_text_changes = 500,
    },
  }
else
  vim.notify("clangd not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

if helpers.executable("vim-language-server") then
  lspconfig.vimls.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 500,
    },
    capabilities = capabilities,
  }
else
  vim.notify("vim-language-server not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

if helpers.executable("bash-language-server") then
  lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

if helpers.executable("lua-language-server") then
  lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            fn.stdpath("data") .. "/site/pack/packer/opt/emmylua-nvim",
            fn.stdpath("config"),
          },
          maxPreload = 2000,
          preloadFileSize = 50000,
        },
      },
    },
    capabilities = capabilities,
  }
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}
require('lspconfig')['bashls'].setup{

}
require('lspconfig')['arduino_language_server'].setup{

}
require('lspconfig')['awk_ls'].setup{

}
require('lspconfig')['csharp_ls'].setup{

}
require('lspconfig')['cssls'].setup{

}
require('lspconfig')['cssmodules_ls'].setup{

}
require('lspconfig')['dockerls'].setup{

}
require('lspconfig')['eslint'].setup{

}
require('lspconfig')['html'].setup{
    capabilities = capabilities,
}
require'lspconfig'.gradle_ls.setup {

    cmd = { os.getenv("HOME") .. '/.local/lsp/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server' },
}
require'lspconfig'.jdtls.setup {

}
require('lspconfig')['groovyls'].setup{

}
require('lspconfig')['hls'].setup {

}
require('lspconfig')['jsonls'].setup{

}
require('lspconfig')['kotlin_language_server'].setup{

}
require('lspconfig')['perlls'].setup{

}

