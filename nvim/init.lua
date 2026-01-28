-- map leader key
vim.g.mapleader = ' '
 
-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true
 
-- vim.opt.tabs to have 4 spaces
vim.opt.tabstop = 4
 
-- indent when moving to the next line while writing code
vim.opt.autoindent = true
 
-- expand tabs into spaces
vim.opt.expandtab = true
 
-- when using the >> or << commands, shift lines by 4 spaces
vim.opt.shiftwidth = 4
 
-- show a visual line under the cursor's current line
vim.opt.cursorline = true
 
-- show the matching part of the pair for [] {} and ()
vim.opt.showmatch = true
 
-- show especial characters
vim.opt.list = true
vim.opt.listchars = 'tab:>-,trail:~,extends:>,precedes:<'
 
-- ignore case when searching
vim.opt.ignorecase = true
 
-- Search down into subfolders
-- Provides tab-completion for all file-related tasks
vim.opt.path:append("**")
 
-- Display all matching files when we tab complete
vim.opt.wildmenu = true
 
-- Set splits below and on the right by default
vim.opt.splitbelow = true
vim.opt.splitright = true
 
-- Spell check - toggle with <leader>s
vim.opt.spell = true
vim.opt.spelllang = {'en_gb'}
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>setlocal spell!<CR>', {})
 
-- Allows the use of the mouse in the editor
vim.opt.mouse = 'a'

-- Folding config
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = ''
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4

-- Lazy.Nvim

require("config.lazy")

-- Nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true
})

-- Lualine
require('lualine').setup()
options = { theme = 'solarized_dark' }

-- Table-Mode
vim.keymap.set('n', '<leader>t', ':Mtm<CR>', {
    noremap = true
})

-- nvim-tmux-navigation
local nvim_tmux_nav = require('nvim-tmux-navigation')

nvim_tmux_nav.setup {
    disable_when_zoomed = true -- defaults to false
}

--nvim-treesitter
require'nvim-treesitter'.install { 'kotlin', 'javascript', 'python', 'markdown' }

vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)


local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
