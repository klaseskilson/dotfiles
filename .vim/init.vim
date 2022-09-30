" General
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set tabstop=2
set expandtab
set updatetime=250
set nocursorline
set noswapfile
set nowrap " dont wrap lines

" mouse magic
set mouse=a

" line number magic
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (this list is really too long now)
call plug#begin('~/.local/share/nvim/plugged')

" utilities
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'marcweber/vim-addon-manager'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'honza/vim-snippets'
Plug 'andrewradev/splitjoin.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

" git and lint ant such
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'

" colorscheme and looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'jeffkreeftmeijer/vim-dim'
Plug 'arcticicestudio/nord-vim'

" syntax and plugins
Plug 'slim-template/vim-slim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/dockerfile.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'isruslan/vim-es6'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'flowtype/vim-flow'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'hashivim/vim-terraform'
Plug 'elixir-editors/vim-elixir'
Plug 'udalov/kotlin-vim'
Plug 'keith/swift.vim'
Plug 'jparise/vim-graphql'

" Prettier and friends
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

" LSP and friends
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" fancy markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
syntax enable
set background=dark
colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Advanced
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ackprg = 'ag --vimgrep --smart-case'
  nnoremap \ :Ack<SPACE>
endif

" Make it obvious where 80 characters is
set textwidth=0
" set colorcolumn=+1
" highlight ColorColumn ctermbg=0

" line number spacing
set numberwidth=5

" adjust commandline autocomplete
set wildmode=list:full
set completeopt=menuone,noinsert

" COC stuff
" Tab completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-n> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-n> coc#refresh()
endif

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add format command to call COC formatting
command! -nargs=0 Format :call CocAction('format')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splitting settings
set splitbelow
set splitright

set ruler " Show row and column ruler information

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

" key mapping related to splitting
nmap <leader>v :vsp<cr>
nmap <C-S> :vsp<cr>
nnoremap <C-K> <C-W><C-W>

" utilsnip config
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Fast saving and exiting
nmap <leader>w :w<cr>
nmap <leader>q :wq<cr>
nmap <leader>e :q<cr>

" Fast duplication and deletion
nmap <leader>d yyp==
nmap <C-B> db

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" search and replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
" search current word
nnoremap <leader>S :Ack <C-r><C-w><cr>
" go to definition
nnoremap <leader>gg :ALEGoToDefinition<cr>
nnoremap <leader>gv :ALEGoToDefinitionInVSplit<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" General
set linebreak	" Break lines at word (requires Wrap lines)
" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Run commands that require an interactive shell
nnoremap <Leader>i :RunInInteractiveShell<space>

" Git tools
nnoremap <leader>b :Git blame<CR>

" Fast .vimrc editing
nnoremap <leader>ccc :e ~/.vimrc<CR>
nnoremap <leader>ccr :so ~/.vimrc<CR>

" make prettier
nmap <Leader>mp <Plug>(Prettier)
nmap <Leader>af :ALEFix<cr>

" neat jump-to-definition shortcuts
" ctrl \ for opening definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" alt ] for opening definition in new split
map <‘> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
" config Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'

" ALE configuration, Error and warning signs.
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align comments
let g:NERDDefaultAlign = 'left'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-type specific options
filetype plugin on
filetype indent on

" Display extra whitespace
autocmd FileType rust set list listchars=tab:»·,trail:·,nbsp:·
autocmd FileType javascript set list listchars=tab:»·,trail:·,nbsp:·

" Rust settings
let g:rustfmt_autosave = 1

" unbreak python 3 provider when using virtualenv
let g:python3_host_prog = '/Users/klaseskilson/.neovim-python-env/bin/python'
