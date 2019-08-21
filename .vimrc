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
