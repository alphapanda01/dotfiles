"printf customisations no vi compatibility
set nocompatible

set clipboard=unnamedplus

" system turns on filetype. force it to off before pathogen
filetype off

" use pathogen to handle all plugins
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

" switching it on again
filetype plugin indent on
syntax on

" Set encoding
set encoding=utf-8

" selection stuff
se mouse+=a

" General Settings
set nowrap
set hidden
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set number
set autoindent

" Search stuff
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


" leader key will be comma ( , )
let mapleader = ","

set autochdir
set listchars=tab:▸\ ,eol:¬
" set list

set cpoptions+=$
set laststatus=2
set autoread

" autocomlpete settings
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" pull all files using ctrl-p plugin
map <Leader>t <c-p>

" dont show --insert-- below because lightline is showing it
set noshowmode

" lightline statusbar config to have git branch info
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" move between windows easily
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|.git'

call plug#begin('~/.vim/plugged')

" add plugins here
" in format
"
" Plug '<path>/<url>/<github_link>'
"
" make sure to use single quotes
" https://github.com/junegunn/vim-plug

" Plug 'doums/barow'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
" Plug 'arcticicestudio/nord-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'dylanaraps/wal.vim'
 
call plug#end()

let g:airline_theme='supernova'
" owo supernova serene

" Display tabs
let g:airline#extensions#tabline#enabled = 1


" Nerd tree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" colorscheme wal
" colorscheme nord
colorscheme dylan_vim
hi Visual term=reverse cterm=reverse guibg=Grey

" https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

