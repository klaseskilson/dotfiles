set nocompatible  " no past!
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
set noswapfile
set nowrap " don't wrap lines
set mouse=a
set number
set clipboard+=unnamedplus
set wildmode=longest,list
set spell
set updatetime=100
set signcolumn=auto
set splitbelow
set splitright
set ruler " Show row and column ruler information
set undolevels=1000 " Number of undo levels
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax stuff
syntax enable
set background=dark
set numberwidth=4
filetype plugin on
filetype indent on
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts and key bindings
let mapleader = ","
let g:mapleader = ","

" System clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

nmap <leader>d yyp== " fast duplication
nmap <leader>e :q<cr> " close buffer
nmap <C-s> :vsp<cr> " fast vertical split

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Customizations
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  " Use AG for Ack
  let g:ackprg = 'ag --vimgrep --smart-case'
  nnoremap \ :Ack<SPACE>
endif

highlight! link SignColumn LineNr
highlight link GitGutterChangeLineNr Underlined
let g:gitgutter_set_sign_backgrounds = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC bindings and configuration
autocmd CursorHold * silent call CocActionAsync('highlight')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bring in the ugliness
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()
