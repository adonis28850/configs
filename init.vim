" map leader key
let mapleader = ","

" enter the current millenium
set nocompatible

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

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
nmap <silent> <leader>s :set spell!<CR>

""""""""" Vim-Plug
" Specify a directory for plugins (vim-plug)
call plug#begin('~/.local/share/nvim/plugged')

" Solarized colors
Plug 'https://github.com/icymind/NeoSolarized.git'

" NerdTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" Deoplete-Jedi
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/davidhalter/jedi.git'
Plug 'zchee/deoplete-jedi'

" Python Linter
Plug 'https://github.com/nvie/vim-flake8.git'

" Vim-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

""""""""" End of Vim-Plug

" solarized colors
set termguicolors
set background=dark
colorscheme NeoSolarized

" NerdTree
autocmd vimenter * NERDTree
" toggle nerdtree
nnoremap <F2> :NERDTreeToggle<cr>

" Deoplete-Jedi
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length = 0

" Airline
let g:airline_theme='solarized'

" This allows buffers to be hidden if you've modified a buffer.
set hidden
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" VimWiki
filetype plugin on
hi VimwikiHeader1 guifg=#FF8000
hi VimwikiHeader2 guifg=#FF3333
hi VimwikiHeader3 guifg=#3333FF
hi VimwikiHeader4 guifg=#B266FF
hi VimwikiHeader5 guifg=#00CC66
hi VimwikiHeader6 guifg=#FFFF00
