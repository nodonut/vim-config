lua require("nodonut")
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc :lua require'telescope.builtin'.colorscheme()<cr>
nnoremap <C-l> :lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>ga :lua require'nodonut.telescope'.git_branches()<cr>
nnoremap <leader>ts :lua require'nodonut.telescope'.git_status()<cr>
nnoremap <leader>lf :lua require'telescope.builtin'.treesitter()<cr>
nnoremap <leader>tc :lua require'nodonut.telescope'.git_commits()<cr>
