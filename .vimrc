" General
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=2	" Number of auto-indent spaces
" set smartindent	" Enable smart-indent
" set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set tabstop=2
set expandtab
set updatetime=250

set cursorline
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Keyboard mappings
let mapleader = ","
let g:mapleader = ","

" Fast saving and exiting
nmap <leader>w :w<cr>
nmap <leader>q :wq<cr>
nmap <leader>e :q<cr>

" easy copying to pb
:nmap <leader>y "*y

" Moving around
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin('~/.local/share/nvim/plugged') 

Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'slim-template/vim-slim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" config Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#ale#enabled = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make sure filetype-specific options are on
filetype plugin on 
filetype indent on

" Remap tab to esc
" nnoremap <Tab> <Esc>
" vnoremap <Tab> <Esc>gV
" onoremap <Tab> <Esc>
" cnoremap <Tab> <C-C><Esc>
" inoremap <Tab> <Esc>`^
" inoremap <Leader><Tab> <Tab>
