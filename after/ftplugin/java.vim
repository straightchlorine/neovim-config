""  vim.lsp
nnoremap <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references() && vim.cmd('copen')<CR>

nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

"" ~ diagnostics
nnoremap <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"" ~ workspaces
nnoremap <leader>wf <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>

nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>

"" jdtls
nnoremap <leader>di <cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <cmd>lua require'jdtls'.extract_variable()<CR>
vnoremap crv <cmd>lua require'jdtls'.extract_variable(true)<CR>
nnoremap crc <cmd>lua require'jdtls'.extract_constant()<CR>
vnoremap crc <cmd>lua require'jdtls'.extract_constant(true)<CR>
vnoremap crm <cmd>lua require'jdtls'.extract_method(true)<CR>

"" nvim-dap
nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
command! -buffer JdtJol lua require('jdtls').jol()
command! -buffer JdtBytecode lua require('jdtls').javap()
command! -buffer JdtJshell lua require('jdtls').jshell()
