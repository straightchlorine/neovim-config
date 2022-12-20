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

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local cmp = require'cmp'
    local lspkind = require'lspkind'

    --local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
    cmp.setup({
      formatting = {
        format = function(entry, vim_item)
          if vim.tbl_contains({ 'path' }, entry.source.name) then
            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            if icon then
              vim_item.kind = icon
              vim_item.kind_hl_group = hl_group
              return vim_item
            end
          end
          return lspkind.cmp_format({ with_text = false })(entry, vim_item)
        end
      },

      enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        end
      end,

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
      mapping = {
        --['<Tab>'] = function(fallback)
        --  if cmp.visible() then
        --    cmp.select_next_item()
        --  else
        --    fallback()
        --  end
        --end,
        --['<S-Tab>'] = function(fallback)
        --  if cmp.visible() then
        --    cmp.select_prev_item()
        --  else
        --    fallback()
        --  end
        --end,
        --['<Esc>'] = cmp.mapping.close(),
        --['<C-e>'] = cmp.mapping.abort(),
        --['<CR>'] = cmp.mapping.confirm { select = true } ,
        --['<C-b>'] = cmp.mapping.scroll_docs(-4),
        --['<C-f>'] = cmp.mapping.scroll_docs(4),

        ["<Tab>"] = cmp.mapping({
          c = function()
              if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              else
                  cmp.complete()
              end
          end,
          i = function(fallback)
              if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                  vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
              else
                  fallback()
              end
          end,
          s = function(fallback)
              if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                  vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
              else
                  fallback()
              end
          end
        }),
        ["<S-Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    fallback()
                end
            end
        }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end
      }),
    },

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
