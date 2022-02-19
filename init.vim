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
Plug 'sainnhe/edge'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-jsx'
Plug 'yuezk/vim-js'
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
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rstacruz/vim-closer'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'rafamadriz/friendly-snippets'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'sbdchd/neoformat'
Plug 'SirVer/ultisnips'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()


"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_improved_strings=0

colorscheme gruvbox

" Neoformat Options
let g:neoformat_try_node_exe = 1

" remaps
let mapleader = " "
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>x :!chmod +x %<CR>

" NERDTree remaps
nnoremap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

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


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
