" map leader key
let mapleader = " "

" enter the current millenium
set nocompatible

" enable syntax highlighting
syntax enable
filetype on

" show line numbers
set number
set relativenumber

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

"allow auto-indenting depending on file type
filetype plugin indent on

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" show especial characters
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" ignore case when searching
set ignorecase

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Set splits below and on the right by default
set splitbelow
set splitright

" Spell check - toggle with <leader>s
set spell spelllang=en_gb
nmap <silent> <leader>s :set spell!<CR>

" Allows the use of the mouse in the editor
set mouse=a

""""""""" Vim-Plug
" Specify a directory for plugins (vim-plug)
call plug#begin('~/.local/share/nvim/plugged')

" Solarized colors
Plug 'https://github.com/icymind/NeoSolarized.git'

" NerdTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" Python Linter
Plug 'mfussenegger/nvim-lint'

" Vim-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Dev Icons
Plug 'ryanoasis/vim-devicons'

" Nerd Commenter
Plug 'preservim/nerdcommenter'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Fuzzy Search
Plug 'ggVGc/vim-fuzzysearch'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Vim Tmux integrated navigation
Plug 'christoomey/vim-tmux-navigator'

" NeoVimis
Plug '/home/antonio/LocalGit/neovimis'

" Initialize plugin system
call plug#end()

""""""""" End of Vim-Plug

" solarized colors
set termguicolors
set background=dark
colorscheme NeoSolarized

" Show hidden files
let NERDTreeShowHidden=1
" toggle nerdtree
nnoremap <leader>e :NERDTreeToggle<cr>

" Airline
let g:airline_theme='solarized'

" This allows buffers to be hidden if you've modified a buffer.
set hidden
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Markdown
set conceallevel=2
let g:markdown_folding = 1
au FileType markdown setlocal foldlevel=99 " Don't fold anything when opening

" nvim-lint
lua <<EOF
require('lint').linters_by_ft = {
  python = {'flake8'}
}
EOF
" Autocmd to trigger linting
au BufWritePost <buffer> lua require('lint').try_lint()

" Disable search highlight with ESC key
map <esc> :noh <CR>

" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

  },

    indent = {
    enable = true
  }
}
EOF

" Vim-FuzzySearch
" Replace in file using last search
nnoremap <leader>r :%s///g<left><left>
" Overwrite default search
nnoremap / :FuzzySearch<CR>

" Open URLs under cursor with `gx`
nmap gx :!open <c-r><c-a><CR>
