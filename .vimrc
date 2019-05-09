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
set redrawtime=10000
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
set foldnestmax=20
set foldlevelstart=21

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
nnoremap <F2>      :set  invpaste paste?<CR>

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
nmap <leader>d :YcmCompleter GetDoc<CR>
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
let g:syntastic_python_checkers          = ['pylint']
let g:syntastic_html_checkers            = ['tidy']
let g:syntastic_javascript_checkers      = ['eslint']
let g:syntastic_php_checkers             = ['php', 'phpcs', 'phpmd']

" GitGutter
let g:gitgutter_realtime  = 1
let g:gitgutter_eager     = 1
let g:gitgutter_max_signs = 10000

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:snips_author                 = "DaubaKao"

" NerdTree
let NERDTreeQuitOnOpen=1

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

" perttier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#print_width = 100

" CtrlP
let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")':   ['<c-n>', '<down>', '<s-tab>'],
            \ 'PrtSelectMove("k")':   ['<c-p>', '<up>', '<tab>'],
            \ 'ToggleFocus()':        [],
            \ 'PrtHistory(-1)':       [],
            \ 'PrtHistory(1)':        [],
            \ }
let g:ctrlp_by_filename = 0

" FZF
nmap <C-p> :GFiles<CR>
let g:fzf_layout = { 'down': '~25%'  }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

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

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" git repo
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
" Plug 'w0rp/ale'

" AutoComplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'joonty/vdebug'
Plug 'pangloss/vim-javascript'

" Typescript
Plug 'leafgarland/typescript-vim'

" Find file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" react 
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'npm install'  }
Plug 'styled-components/vim-styled-components'

call plug#end()
