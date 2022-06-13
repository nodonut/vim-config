autocmd FileType scss setl iskeyword+=@-@
scriptencoding utf-8
syntax on
set cursorline
set nohlsearch
set number
set relativenumber
set tabstop=4 softtabstop=4
set scrolloff=8
set shiftwidth=4
set expandtab
set smartindent
set termguicolors
set hlsearch
set clipboard+=unnamedplus
set background=dark

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'pacokwon/onedarkhc.vim' 
Plug 'ghifarit53/tokyonight-vim'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'sainnhe/sonokai'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/edge'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rstacruz/vim-closer'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'rafamadriz/friendly-snippets'
Plug 'sbdchd/neoformat'
Plug 'SirVer/ultisnips'
Plug 'APZelos/blamer.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()


"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_improved_strings=0
colorscheme gruvbox

" Neoformat Options
let g:neoformat_try_node_exe = 1


" remaps
let mapleader = " "
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>x :!chmod +x %<CR>
nnoremap <leader>sc :let @/ = ""<CR>
nnoremap <leader>rl :let @+ = expand("%")<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gb :Git blame<CR>

" NERDTree remaps
nnoremap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" NERDTree customization
let NERDTreeWinPos="right"
let NERDTreeWinSize=45

" coc remaps
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

let g:jsdoc_lehre_path = '~/.nvm/versions/node/v14.4.0/lib/node_modules/lehre/bin/lehre'

" Prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile


lua require('nodonut')
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc :lua require'telescope.builtin'.colorscheme()<cr>
nnoremap <C-l> :lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>ga :lua require'nodonut.telescope'.git_branches()<cr>
nnoremap <leader>ts :lua require'nodonut.telescope'.git_status()<cr>

" Quickfix List remaps
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>

" Coc snippets
imap <C-l> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']


" RuboCop keybind
nnoremap <leader>rb :RuboCop<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
