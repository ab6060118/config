imap jj <ESC>

syntax on
syntax enable

set expandtab
set shiftwidth=2
set number
set tabstop=4
set t_Co=256
set laststatus=2		" vim status bar
" let g:Powerline_symbols = 'fancy'

filetype indent on
filetype plugin indent on
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" supertab
let g:SuperTabDefaultCompletionType = "context"

" zencoding

let iiCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" git repo
Bundle 'Lokaltog/vim-powerline'
Bundle 'rkulla/pydiction'
Bundle 'ervandew/supertab'
Bundle 'AutoComplPop'
Bundle 'mattn/emmet-vim'
