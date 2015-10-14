""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Config                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
syntax enable

set expandtab
set shiftwidth=4
set number
set tabstop=4
set laststatus=2		" vim status bar
set wildmenu
set autoindent
set hlsearch

" Color scheme
set t_Co=256
colorscheme wombat256
set background=light
hi Comment ctermfg=red

filetype plugin on

" folding
set foldenable 
autocmd filetype python set foldmethod=indent
autocmd filetype php set foldmethod=indent
autocmd filetype html set foldmethod=indent
set foldcolumn=0 
set foldnestmax=2 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mapping                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" general key mapping 
inoremap    jj          <ESC>
nnoremap    <space>     za
nnoremap    <leader>b   :call BackgroundToggle()<CR>

" key mapping for adding comment to code
autocmd filetype php    map <F7> :s/^/\/\//g<CR>
autocmd filetype php    map <F8> :s/^\/\///g<CR>

" key mapping for executing code
" autocmd filetype cpp    map <F9> :w<CR>:make clean<CR>:make<CR>:!./a.out<CR>
autocmd filetype c      map <F9> :w<CR>:!gcc -lm % && ./a.out<CR>
autocmd filetype sh     map <F9> :w<CR>:!bash %<CR>
autocmd filetype php    map <F9> :w<CR>:!php %<CR>
autocmd filetype python map <F9> :w<CR>:!`which python3.4` %<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Confiuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:Powerline_symbols = 'fancy'

" python dictionary
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" supertab
let g:SuperTabDefaultCompletionType = "context"

" zencoding
let g:user_emmet_leader_key='<C-Z>'

" vdebug
" let g:vdebug_keymap = { 'step_over': '<S-Q>', 'step_into': '<S-W>', 'step_out': '<S-E>' }
" let g:vdebug_options = {'break_on_open': 0}

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:background_opacity = 1

function BackgroundToggle()
    echo "execute"
    if ! exists("g:background_opacity")
        return
    endif


    if g:background_opacity
        execute "highlight Normal ctermbg=none"
        execute "highlight LineNr ctermbg=none"
    else
        execute "highlight Normal ctermbg=234"
        execute "highlight LineNr ctermbg=232"
    endif

    let g:background_opacity = !g:background_opacity
endfunction

if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" git repo
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'rkulla/pydiction'
Bundle 'ervandew/supertab'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'AutoComplPop'
Bundle 'mattn/emmet-vim'
" Bundle 'joonty/vdebug'
