""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Config                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set nocompatible

set cursorline             " Find the current line quickly.
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set nobackup
set nowritebackup
set hidden                 " Switch between buffers without having to save first.
set number
" set expandtab              " Use spaces instead of tabs.
set wildmenu
set autoindent             " Indent according to previous line.
set hlsearch
set ignorecase
set smartcase
set list
set autoread              " auto reload thefile when the file changed"
set scrolloff   =4
set encoding    =utf8
set backspace   =indent,eol,start
set tabstop     =4
set report      =0        " Always report changed lines.
set synmaxcol   =200      " Only highlight the first 200 columns.
set display     =lastline " Show as much as possible of the last line.
set softtabstop =4        " Tab key indents by 4 spaces.<Paste>
set shiftwidth  =4        " indents by 4 spaces.
set laststatus  =2        " vimstatusbar
set shiftround            " indents to next multiple of 'shiftwidth'.
set clipboard   =unnamed
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

autocmd filetype python     set foldmethod=indent
autocmd filetype javascript,javascript.jsx set foldmethod=syntax
autocmd filetype typescript,typescript.tsx set foldmethod=syntax
autocmd filetype php        set foldmethod=indent

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
cnoremap <c-n>     <down>
cnoremap <c-p>     <up>

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
autocmd BufNewFile,BufRead *.js  set filetype=javascript
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts  set filetype=typescript

" set different indent style
autocmd FileType javascript,html,css,less,scss,typescript,typescript.tsx,javascript.jsx set tabstop=2 softtabstop=2 shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Confiuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled    = 1
let g:airline#extensions#branch#enabled   = 1
let g:airline_powerline_fonts             = 1

" emmet-vim
let g:user_emmet_leader_key = '<C-Z>'

" YouCompleteMe
" nmap <leader>d :YcmCompleter GetDoc<CR>
" nmap <leader>f :YcmCompleter FixIt<CR>
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer                  = 1
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:ycm_filetype_blacklist                        = {
" \ 'tagbar' : 1,
" \ 'qf' : 1,
" \ 'notes' : 1,
" \ 'unite' : 1,
" \ 'text' : 1,
" \ 'vimwiki' : 1,
" \ 'gitcommit' : 1,
" \}

" IndentLine
let g:indentLine_char = '¦'

" MultipleCursors
let g:multi_cursor_exit_from_insert_mode = 0

" GitGutter
let g:gitgutter_realtime  = 1
let g:gitgutter_eager     = 1
let g:gitgutter_max_signs = 10000

" " Ultisnips
" let g:UltiSnipsExpandTrigger       = "<Tab>"
" let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
" let g:snips_author                 = "DaubaKao"

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
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" FZF
nmap <C-p> :GFiles<CR>
let g:fzf_layout = { 'down': '~25%'  }
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
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

" ALE

"COC
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <leader>f <Plug>(coc-fix-current)
nmap <leader>d <Plug>(coc-definition)
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = [
            \'coc-tsserver',
            \'coc-snippets',
            \'coc-css',
            \'coc-html',
            \'coc-json',
            \]
" \ 'coc-highlight',
" \ 'coc-stylelint',
" \ 'coc-tag',

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

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
" git repo
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'

" lint
" Plug 'w0rp/ale'


" AutoComplete
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

" Snippet
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Find file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" All Syntax highlight
Plug 'sheerun/vim-polyglot'

" react 
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
Plug 'prettier/vim-prettier', { 'do': 'npm install'  }

call plug#end()
