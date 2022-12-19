--  local cmp = require'cmp'
--  local lspkind = require'lspkind'
--
--  cmp.setup {
--    snippet = {
--      expand = function(args)
--        vim.fn["UltiSnips#Anon"](args.body)
--      end,
--    },
--    sources = cmp.config.sources {
--    },
--    completion = {
--      keyword_length = 1,
--      completeopt = 'menu,noselect',
--    },
--    formatting = {
--      format = lspkind.cmp_format {
--        mode = 'symbol_text',
--        menu = {
--          nvim_lsp = "[LSP]",
--          ultisnips = "[US]",
--          nvim_lua = "[Lua]",
--          path = "[Path]",
--          buffer = "[Buffer]",
--          emoji = "[Emoji]",
--          omni = "[Omni]",
--        }
--      },
--    },
--  }
--
--  vim.cmd([[
--    highlight! link CmpItemMenu Comment
--    " gray
--    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--    " blue
--    highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--    highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--    " light blue
--    highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--    highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--    highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--    " pink
--    highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--    highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--    " front
--    highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--    highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--    highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
--  ]])
--
--  -- Set configuration for specific filetype.
--  cmp.setup.filetype('gitcommit', {
--    sources = cmp.config.sources({
--      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--    }, {
--      { name = 'buffer' },
--    })
--  })
--
--  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--      { name = 'buffer' }
--    }
--  })
--
--  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })
--
    local cmp = require'cmp'
    --local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
    require("cmp").setup({
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      window = {
        cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources({
        { name = 'buffer',
          option = {
            keyword_pattern = [[\k\+]],
          }
        },
        { name = 'buffer-lines',
          option = {},
        },
        { name = 'calc' },
        { name = 'dictionary' },
        { name = 'digraph' },
        { name = 'emoji', insert = true },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'omni' },
        { name = 'path' },
        { name = "ultisnips" },
        { name = 'spell',
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
            },
        },
      }),
      sorting = {
        comparators = {
          -- distance based autocompletion sorting
          function(...)
            return require'cmp_buffer':compare_locality(...)
          end,
        }
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        ['<Esc>'] = cmp.mapping.close(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true } ,
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
      }),
    })

        -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_document_symbol' }
      },{
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  }, {
    { name = 'buffer' }
  })
})
