local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.mode = ({'text'})
      vim_item.menu = ({
          buffer = "β",
          bufferlines = "Β",
          calc = "κ",
          dictionary = "Δ",
          digraphs = "Γ",
          emoji = "ω",
          nvim_lsp = "λ",
          nvim_lsp_signature_help = "Λ",
          nvim_lua = "ι",
          omni = "Ω",
          path = "ζ",
          ultisnips = "Θ",
          spell = "φ",
          cmdline = "Σ"
      })[entry.source.name]

      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          return vim_item
        end
      end
      return lspkind.cmp_format({ with_text = false })(entry, vim_item)
    end
  },
  view = {
    entries = {
      name = 'native',
      selection_order = 'near_cursor',
    }
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
    completion = {
      border = 'none',
    },
    documentation = {
      border = 'none',
    },
  },
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      keyword_length = 3,
      priority = 0,
      group_index = 1,
    },
    --{ name = 'buffer',
    --  keyword_length = 3,
    --  group_index = 2,
    --  option = {

    --  }
    --},
    --{ name = 'calc' },
    --{ name = 'dictionary' },
    --{ name = 'emoji', insert = true },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'omni' },
    { name = 'path' },
    { name = 'ultisnips' },
    --{ name = 'spell',
    --    option = {
    --        keep_all_entries = false,
    --        enable_in_context = function()
    --            return true
    --        end,
    --    },
    --},
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
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    view= {
      entries = {
        name = 'custom',
        separator = '|'
      }
    },
    sources = {
        {
            name = "buffer",
            option = { keyword_pattern = [[\k\+]] }
        },
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    view= {
      entries = {
        name = 'custom',
      }
    },
    sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
    })
})

-- highlighting
-- TODO: write something that will take in json from wpg or some other generator and put it here
-- TODO: manage more highlighting, possibly the nvim itself, would be cool i guess 
vim.api.nvim_set_hl(0, 'PmenuSel',                  { bg = "#3B427B", fg = "NONE" })
vim.api.nvim_set_hl(0, 'Pmenu',                     { fg = "#f5f6f6", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'PmenuSbar',                 { fg = "#f5f6f6", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated',     { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch',          { fg = "#82AAFF", bg = "NONE", bold = true,  } )
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy',     { fg = "#82AAFF", bg = "NONE", bold = true,  })
vim.api.nvim_set_hl(0, 'CmpItemMenu',               { fg = "#C792EA", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, 'CmpItemKindField',          { fg = "#EED8DA", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty',       { fg = "#EED8DA", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, '',                          { fg = "#EED8DA", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindText',           { fg = "#C3E88D", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum',           { fg = "#C3E88D", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword',        { fg = "#C3E88D", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant',       { fg = "#FFE082", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor',    { fg = "#FFE082", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindReference',      { fg = "#FFE082", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction',       { fg = "#EADFF0", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct',         { fg = "#EADFF0", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindClass',          { fg = "#EADFF0", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindModule',         { fg = "#EADFF0", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator',       { fg = "#EADFF0", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable',       { fg = "#C5CDD9", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindFile',           { fg = "#C5CDD9", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit',           { fg = "#F5EBD9", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet',        { fg = "#F5EBD9", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder',         { fg = "#F5EBD9", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod',         { fg = "#DDE5F5", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindValue',          { fg = "#DDE5F5", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember',     { fg = "#DDE5F5", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface',      { fg = "#D8EEEB", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindColor',          { fg = "#D8EEEB", bg = "#0c0d16" })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter',  { fg = "#D8EEEB", bg = "#0c0d16" })
