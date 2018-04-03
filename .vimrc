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
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set tabstop=2
set expandtab
set updatetime=250

set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (this list is really too long now)
call plug#begin('~/.local/share/nvim/plugged')

" utilities
Plug 'ctrlpvim/ctrlp.vim'
Plug 'marcweber/vim-addon-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdcommenter'
Plug 'sirver/ultisnips'

" git and lint ant such
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

" colorscheme and looks
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax and plugins
Plug 'slim-template/vim-slim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/dockerfile.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'isruslan/vim-es6'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
syntax enable
set background=dark
colorscheme solarized

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

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=0

" line number spacing
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<c-j>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splitting settings
set splitbelow
set splitright

set ruler " Show row and column ruler information

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
let mapleader = ","
let g:mapleader = ","

" key mapping related to splitting
nmap <leader>v :vsp<cr>
nmap <C-S> :vsp<cr>
nmap <C-K> <C-W><C-W>

" utilsnip config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Fast saving and exiting
nmap <leader>w :w<cr>
nmap <leader>q :wq<cr>
nmap <leader>e :q<cr>
nmap <leader>f :Ex<cr>

" Duplicate line using ,d
nmap <leader>d yyp==

" Run spec in vagrant on current file
au FileType ruby nmap <leader>r :!vagrant ssh -c 'bundle exec rspec %'<cr>

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

" learn this goddammit
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Run commands that require an interactive shell
nnoremap <Leader>i :RunInInteractiveShell<space>

" Git tools
nnoremap <leader>b :Gblame<CR>

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
" Align comments
let g:NERDDefaultAlign = 'left'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-type specific options
filetype plugin on
filetype indent on

" Setup Go support
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab

" Display extra whitespace
autocmd FileType ruby set list listchars=tab:»·,trail:·,nbsp:·
autocmd FileType rust set list listchars=tab:»·,trail:·,nbsp:·
autocmd FileType javascript set list listchars=tab:»·,trail:·,nbsp:·

" Rust settings
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" activate snippets!
" autocmd FileType go set list listchars=trail:·
call vam#ActivateAddons(['vim-snippets', 'UltiSnips'])
