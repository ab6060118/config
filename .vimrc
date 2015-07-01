imap jj <ESC>

syntax on
syntax enable

set expandtab
set shiftwidth=4
set number
set tabstop=4
set laststatus=2		" vim status bar
set wildmenu
set autoindent

set t_Co=256
colorscheme wombat256

"folding
set foldenable 
autocmd filetype python set foldmethod=indent
autocmd filetype php set foldmethod=indent
autocmd filetype html set foldmethod=indent
set foldcolumn=0 
set foldnestmax=2 
nnoremap <space> za


" let g:Powerline_symbols = 'fancy'

" python dictionary
 let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" supertab
let g:SuperTabDefaultCompletionType = "context"

" zencoding
let g:user_emmet_leader_key='<C-Z>'

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
" Bundle 'Lokaltog/vim-powerline'
Bundle 'rkulla/pydiction'
Bundle 'ervandew/supertab'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'AutoComplPop'
Bundle 'mattn/emmet-vim'
