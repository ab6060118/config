""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Config                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
syntax enable

set hidden
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
filetype indent on

" Color scheme
colorscheme wombat256
set t_Co=256
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
autocmd filetype javascript set foldmethod=syntax
autocmd filetype typescript set foldmethod=syntax
autocmd filetype php set foldmethod=indent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mapping                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" general key mapping 
inoremap jj        <ESC>
nnoremap <space>   za
nnoremap <leader>b :call BackgroundToggle()<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>t :badd 
nnoremap <S-Q>     :bprev<CR>
nnoremap <S-W>     :bnext<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>n :sp<CR>
nnoremap <leader>N :vsp<CR>
nnoremap <F12>     :NERDTreeToggle<CR>
nnoremap <F2>      :set invpaste paste?<CR>

" key mapping for executing code
autocmd filetype c      map <F9> :w<CR>:!gcc % -lm && ./a.out<CR>
autocmd filetype cpp    map <F9> :w<CR>:make clean<CR>:make<CR>:!./a.out<CR>
autocmd filetype sh     map <F9> :w<CR>:!bash %<CR>
autocmd filetype php    map <F9> :w<CR>:!php %<CR>
autocmd filetype python map <F9> :w<CR>:!`which python2.7` %<CR>

" Mapping for swap line cursor moving
nnoremap   k            gk
nnoremap   gk           k
nnoremap   j            gj
nnoremap   gj           j

" set filetypes
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript
autocmd BufNewFile,BufRead *.ts set filetype=typescript

" set different indent style
autocmd FileType javascript,html,css,less,scss,typescript set tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType php setl omnifunc=phpcomplete#CompletePHP

" ctag
nnoremap <C-]> <C-w><C-]><C-w>T

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Confiuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#fnamemod       = ':t'
let g:airline#extensions#hunks#enabled          = 1
let g:airline#extensions#branch#enabled         = 1
let g:airline_powerline_fonts                   = 1

" emmet-vim
let g:user_emmet_leader_key = '<C-Z>'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer                  = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_blacklist                        = {
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'unite' : 1,
  \ 'text' : 1,
  \ 'vimwiki' : 1,
  \ 'gitcommit' : 1,
  \}

" vdebug
" let g:vdebug_keymap = { 'step_over': '<S-Q>', 'step_into': '<S-W>', 'step_out': '<S-E>' }
" let g:vdebug_options = {'break_on_open': 0}

" IndentLine
let g:indentLine_char = '¦'

" MultipleCursors
let g:multi_cursor_exit_from_insert_mode = 0

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

" Ternjs
let tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints   = 'on_move'
let g:tern_show_signature_in_pum = 1

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:snips_author                 = "DaubaKao"

" NerdTree
let NERDTreeQuitOnOpen=0

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

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" typescript-vim
" let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'

" CtrlP
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-n>', '<down>', '<s-tab>'],
    \ 'PrtSelectMove("k")':   ['<c-p>', '<up>', '<tab>'],
    \ 'ToggleFocus()':        [],
    \ 'PrtHistory(-1)':       [],
    \ 'PrtHistory(1)':        [],
\ }
let g:ctrlp_by_filename = 1

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
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'

" AutoComplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
" Plugin 'shawncplus/phpcomplete.vim'

" Snippet
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Plugin 'joonty/vdebug'

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'

" Typescript
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'

" Find file
Plugin 'kien/ctrlp.vim'
