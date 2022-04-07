"printf customisations no vi compatibility
set nocompatible
"set clipboard=unnamedplus

" system turns on filetype. force it to off before pathogen
filetype off

" switching it on again
filetype plugin indent on
syntax on

" Set encoding
set encoding=utf-8

" selection stuff
se mouse+=a
set ttymouse=xterm2
set ballooneval
set balloonevalterm

" General Settings
set nowrap
set hidden
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set number
set autoindent
set relativenumber


" Fix annoying block cursor on alacritty
autocmd BufWinLeave * silent !cursor-reset.sh

" The escape shenanigans
autocmd VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' 
autocmd VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock' 


" Search stuff
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>
set path+=/usr/include/c++/**/**,/usr/lib/gcc/**/**

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" leader key will be comma ( , )
let mapleader = ","

set autochdir
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

" move between windows easily
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" My Shortcuts
set termwinsize=15x0
map <C-s> :terminal<CR>


" Some other ale stuff
" let g:ale_completion_enabled = 1
" let g:ale_completion_autoimport = 0
" set omnifunc=ale#completion#OmniFunc

" Coc Vim stuff
set cmdheight=2
set updatetime=300
" set shortmess+=cmdheight

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Coc functions
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Toggle coc vim
function! CocToggle()
    if g:coc_enabled
        CocDisable
    else
        CocEnable
    endif
endfunction
nmap <F10> :call CocToggle()<CR>

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" CocList Stuff
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>p  :<C-u>CocList<CR>

" Status line        
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction



" ============================================================

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
" Plug 'arcticicestudio/nord-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'

" Nerd fonts
Plug 'ryanoasis/vim-devicons'

" Xcode color scheme
Plug 'arzg/vim-colors-xcode'

" Cool guy stuff
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'

" Tags -> Install `ctags` for this
Plug 'preservim/tagbar'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

" Syntax
" Plug 'vim-syntastic/syntastic'
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fzf 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" CtrlP TODO
" Plug 'ctrlpvim/ctrlp.vim'

" Simple text auto completion
Plug 'Raimondi/delimitMate'

call plug#end()

" =======================================================

" vim-airline stuff
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='supernova'
" owo supernova serene deus
let g:airline#extensions#tabline#enabled = 1 " Display tabs
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.colnr = '  %'

" Airline coc setting
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#coc#error_symbol = "E: "
let g:airline#extensions#coc#warning_symbol = "W: "

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" let g:airline_section_c = "%{get(b:,'coc_current_function','')}"
let g:airline_section_c = "%{coc#status()}%{get(b:,'coc_current_function','')}"


" Nerd tree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" colorscheme nord
" colorscheme dylan_vim
colorscheme xcodedark
" hi Visual term=reverse cterm=reverse guibg=Grey

" Tags config
nmap <F8> :TagbarToggle<CR>

" https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


" Git gutter config
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
let g:gitgutter_show_msg_on_hunk_jumping = 0
nmap <F9> :GitGutterToggle<CR>

" Syntastic options
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height=3

" Toggle Syntastic
" nmap <F7> :SyntasticToggleMode<CR> 

" ALE options
" let g:ale_list_window_size = 5
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

" Ale shortcuts
" nmap <F10> :ALEToggle<CR> 
" nmap ]a :ALENextWrap<CR>
" nmap [a :ALEPreviousWrap<CR>
" nmap ]A :ALELast
" nmap [A :ALEFirst

" Ale ballon
" let g:ale_hover_cursor = 0
" let g:ale_set_balloons = 1
" let g:ale_floating_preview = 1

" don't run ale until file save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

" Ale Python
" let g:ale_linters = {
" \   'python': ['flake8', 'flake8-bugbear', 'mypy'],
" \}
" let b:ale_fixers = { 
" \   'python': ['black']
" \}


" Resize splits height
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" resize width
" nnoremap <C-]> :vertical res +3<CR>
" nnoremap <C-[> :vertical res -3<CR>

" fzf config
nnoremap <C-f> :Files<CR>

" CtrlP stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'ra'

" Local vimrc 
let g:localrc_filename = ".local.vimrc"
