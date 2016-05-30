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
set nocompatible
set ignorecase
set encoding=utf8
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set laststatus=2		"vimstatusbar
let @/=""

filetype plugin on

" Color scheme
colorscheme wombat256
set t_Co=256
set background=light
hi Comment ctermfg=red

autocmd filetype php set omnifunc = phpcomplete#CompletePHP

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Folding                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldenable 
set foldcolumn=0 
set foldnestmax=5
set foldlevelstart=6

autocmd filetype python set foldmethod = indent
autocmd filetype php set foldmethod    = indent
autocmd filetype html set foldmethod   = indent

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
autocmd filetype c      map <F9> :w<CR>:!gcc % -lm && ./a.out<CR>
autocmd filetype cpp    map <F9> :w<CR>:make clean<CR>:make<CR>:!./a.out<CR>
autocmd filetype sh     map <F9> :w<CR>:!bash %<CR>
autocmd filetype php    map <F9> :w<CR>:!php %<CR>
autocmd filetype python map <F9> :w<CR>:!`which python2.7` %<CR>

" add filetype for Ultisnip
autocmd FileType php :UltiSnipsAddFiletypes php
autocmd FileType python :UltiSnipsAddFiletypes python

" Mapping for swap line cursor moving
nnoremap   k            gk
nnoremap   gk           k
nnoremap   j            gj
nnoremap   gj           j

" set different indent style
autocmd FileType javascript,html,css,less set tabstop=2 softtabstop=2 shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Confiuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#fnamemod       = ':t'
let g:airline#extensions#hunks#enabled          = 1
let g:airline#extensions#branch#enabled         = 1
let g:airline_powerline_fonts                   = 1
let g:airline#extensions#tabline#left_sep       = ' '
let g:airline#extensions#tabline#left_alt_sep   = '|'

" emmet-vim
let g:user_emmet_leader_key = '<C-Z>'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer                  = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" vdebug
" let g:vdebug_keymap = { 'step_over': '<S-Q>', 'step_into': '<S-W>', 'step_out': '<S-E>' }
" let g:vdebug_options = {'break_on_open': 0}

" IndentLine
let g:indentLine_char = '¦'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_loc_list_height          = 5
let g:syntastic_python_checkers          = ['pylint']
let g:syntastic_html_checkers            = ['tidy']
let g:syntastic_javascript_checkers      = ['jshint']
let g:syntastic_php_checkers             = ['php', 'phpcs', 'phpmd']

" GitGutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager    = 1

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:snips_author                 = "Dauba"

" NerdCommenter
" Add a space before comment
let g:NERDSpaceDelims=1

" Easy align
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String']  }
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Others                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let iCanHazVundle =1
let vundle_readme = expand('~/.vim/bundle/vundle/README.md')
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
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/vim-easy-align'

" Snippet
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'joonty/vdebug'
