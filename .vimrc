""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Config                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
syntax enable

set number
set expandtab
set wildmenu
set autoindent
set hlsearch
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set laststatus=2		" vim status bar
let @/ = ""

filetype plugin on

" Color scheme
set t_Co=256
colorscheme wombat256
set background=light
hi Comment ctermfg=red


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Folding                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldenable 
set foldcolumn=0 
set foldnestmax=5
set foldlevelstart=6
autocmd filetype python set foldmethod=indent
autocmd filetype php set foldmethod=indent
autocmd filetype html set foldmethod=indent

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
autocmd filetype c      map <F9> :w<CR>:!gcc -lm % && ./a.out<CR>
autocmd filetype cpp    map <F9> :w<CR>:make clean<CR>:make<CR>:!./a.out<CR>
autocmd filetype sh     map <F9> :w<CR>:!bash %<CR>
autocmd filetype php    map <F9> :w<CR>:!php %<CR>
autocmd filetype python map <F9> :w<CR>:!`which python2.7` %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Confiuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" supertab
" let g:SuperTabDefaultCompletionType = 'context'

" Jedi
let g:jedi#completions_enabled = 0

" emmet-vim
let g:user_emmet_leader_key = '<C-Z>'

" YouCompleteMe

" vdebug
" let g:vdebug_keymap = { 'step_over': '<S-Q>', 'step_into': '<S-W>', 'step_out': '<S-E>' }
" let g:vdebug_options = {'break_on_open': 0}

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')

" IndentLine
let g:indentLine_char = '¦'

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
Plugin 'gmarik/vundle'

" git repo
" Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'joonty/vdebug'
Plugin 'Yggdroot/indentLine'
