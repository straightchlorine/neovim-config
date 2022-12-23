require("bufferline").setup {
  options = {
      mode = 'buffers',
      numbers = 'none',
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
          style = 'underline'
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      name_formatter = function(buf)  -- buf contains:
            -- name                | str        | the basename of the active file
            -- path                | str        | the full path of the active file
            -- bufnr (buffer only) | int        | the number of the active buffer
            -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
            -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
      end,
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics =  "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon .. count
      end,
      custom_filter = function(buf_number, buf_numbers)
          -- help files aren't displayed as separate buffer
          if vim.bo[buf_number].filetype ~= 'help' then
              return true
          end

          -- logs aren't displayed
          local logs =
              vim.tbl_filter(
                  function(b)
                      return vim.bo[b].filetype == "log"
                  end,
                  buf_nums
              )
          if vim.tbl_isempty(logs) then
              return true
          end

          local tab_num = vim.fn.tabpagenr()
          local is_log = vim.bo[buf].filetype == "log"
          return (tab_num == 2 and is_log) or (tab_num ~= 2 and not is_log)
      end,
      offsets = {
          {
              filetype = "NvimTree",
              text = function()
                return vim.fn.getcwd()
              end,
              text_align = "left",
              separator = true,
              highlight = "Directory"
          }
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_buffer_default_icon = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      separator_style = "slant",
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
      },
      sort_by = 'extension' -- maybe some logic in the future
  }
}
