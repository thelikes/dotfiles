" Vundle
set nocompatible " be iMproved, required
filetype off

let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'TomNomNom/xoria256.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'spolu/dwm.vim.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'ervandew/supertab.git'
"Plugin 'garbas/vim-snipmate.git'
"Plugin 'honza/vim-snippets.git'
"Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'mileszs/ack.vim.git'
"Plugin 'plasticboy/vim-markdown.git'
Plugin 'reedes/vim-lexical.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'terryma/vim-multiple-cursors.git'
"Plugin 'tomtom/tlib_vim.git'
Plugin 'tpope/vim-surround.git'
Plugin 'chrisbra/NrrwRgn.git'

call vundle#end()

" Required for vundle
"filetype plugin indent on 
filetype plugin on 
" End Vundle

set encoding=utf-8

" Highlighting
syntax on

" Colors

" Colorscheme
if &t_Co == 256
    try
        color xoria256
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

" Transparent background
hi Normal ctermbg=none
hi NonText ctermbg=none

" Override xoria and give the sybmols colors
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" Override xoria and set the column background transparent
hi LineNr ctermbg=none
" Override xoria and set the current line column number to the bright green
hi CursorLineNr ctermfg=148 cterm=bold
" ---

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#left_alt_sep = '|'

" Resume previous cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" ---

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" display
"set mouse=a
set history=2000
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set undofile
" leader
let mapleader = ","
nnoremap <leader><space> :noh<cr>

" search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"lines
set modelines=0
set relativenumber
set wrap
set textwidth=79
set formatoptions=qrn1

" ack-grep
nnoremap <leader>a :Ack

" ---

" html
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"let g:html_indent_inctags = "html,body,head,tbody"
"let g:html_indent_script1 = "inc"
"let g:html_indent_style1 = "inc"
"let javascript_enable_domhtmlcss=1

" markdown
"let g:vim_markdown_folding_disabled=1

" vim lexical
filetype plugin on
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1         " 0=disabled, 1=enabled

" multiple cursors - remamp vim-multiple-cursors to not break dwm
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
