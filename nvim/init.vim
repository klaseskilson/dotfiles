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
set cursorline

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

" NERDtree mappings
nmap <leader>n :NvimTreeFindFile<cr>
nmap <leader>m :NvimTreeToggle<cr>

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

" Pretty sign column for git stuff
highlight! link SignColumn LineNr
highlight link GitGutterChangeLineNr Underlined
let g:gitgutter_set_sign_backgrounds = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC bindings and configuration - Most of it from example configuration
" Functions
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  :Format<cr>

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use tab and shift-tab to navigate through popup menu
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use <leader>qf to run quick fix
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>qq <Plug>(coc-codeaction)
nmap <leader>ql <Plug>(coc-codeaction-line)
nmap <leader>qc <Plug>(coc-codeaction-cursor)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline configuration
let g:lightline = {
    \   'active': {
    \     'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'readonly', 'relativefilename', 'modified' ],
    \       [ 'cocstatus', 'currentfunction' ]
    \     ],
    \     'right': [
    \       [ 'lineinfo' ],
    \       [ 'percent' ],
    \       [ 'gitbranch', 'fileformat', 'fileencoding', 'filetype' ]
    \     ]
    \   },
    \   'component_function': {
    \     'cocstatus': 'coc#status',
    \     'currentfunction': 'CocCurrentFunction',
    \     'gitbranch': 'FugitiveHead',
    \     'relativefilename': 'LightlineFilename'
    \   }
    \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copilot mapping
" Requires iTerm mapping: Shift-Enter: [13;2u (^Enter: [13;5u)
imap <silent><script><expr> <S-CR> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language-specific
" aug python
"   au!
"   au BufWrite *.py call CocAction('format')
" aug END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
let NERDTreeShowHidden=1
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
" Load Gruvbox theme on enter
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = '1'
autocmd vimenter * ++nested colorscheme gruvbox

" Workaround for creating transparent background
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
        \ |    highlight LineNr     ctermbg=NONE guibg=NONE
        \ |    highlight SignColumn ctermbg=NONE guibg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bring in the ugliness
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'github/copilot.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'jellydn/hurl.nvim'
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim-tree config
lua << EOF
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treesitter config
lua << EOF
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "yaml", "markdown", "markdown_inline", "terraform", "typescript", "javascript" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
  }
EOF

"
