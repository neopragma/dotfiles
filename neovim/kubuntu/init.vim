call plug#begin()
" plenary is a prerequisite to many Lua-based plugins
 Plug 'nvim-lua/plenary.nvim'

"Theme (color scheme)
 Plug 'mhartington/oceanic-next'


" File explorer
 Plug 'preservim/nerdtree'

" Enhanced status line and tab manager 
  " Enhanced status line and tab management
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

" Indentation guides
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'lukas-reineke/indent-blankline.nvim'   " Requires tree-sitter"

" Add closing brackets, parentheses, braces
 Plug 'jiangmiao/auto-pairs'

 " Code snippets
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'

" Comment and uncomment lines
 Plug 'preservim/nerdcommenter'

" Code autocompletion
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'zchee/deoplete-jedi'  " Python autocompletion

" Text alignment
Plug 'godlygeek/tabular'

" Refactoring support
 Plug 'ThePrimeagen/refactoring.nvim'

" Git integration
 Plug 'tpope/vim-fugitive'


 "JSON editing support
 Plug 'elzr/vim-json'

 "Markdown editing support
 Plug 'preservim/vim-markdown'


 
" Filetype icons honored by various other plugins. Must be loaded last.
" NOTE: Neither of these works at all on Kubuntu running neovim in a Konsole
" window. I was not able to find any help in documentation or reported issues.
" FWIW they both worked "out of the box" on Ubuntu under Windows Subsystem for Linux.
"
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'


 call plug#end()


"----------------------------------------------------------------------------
" OceanicNext theme configuration

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext

" Allow terminal background color through OceanicNext
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE 


"----------------------------------------------------------------------------
" NERDTree configuration
"----------------------------------------------------------------------------
 
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Prevent NERDtree crashes when vim-plug functions are called while the
" cursor is in the NERDtree window
let g:plug_window = 'noautocmd vertical topleft new'

" Toggle NERDTree open/closed with F6
nmap <F6> :NERDTreeToggle<CR>


"----------------------------------------------------------------------------
" vim-airline configuration
"----------------------------------------------------------------------------

" Display all buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#formatter = 'unique_tail'

" Set the Airline theme
let g:airline_theme='bubblegum'

" Restore Airline theme when it forgets (workaround for bug)
nmap <F12> :AirlineTheme bubblegum<CR>

"----------------------------------------------------------------------------
" nvim-treesitter configuration
"----------------------------------------------------------------------------
"
lua <<EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  }
}
EOF

"----------------------------------------------------------------------------
" indent-blankline configuration
"----------------------------------------------------------------------------
"
lua <<EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF

"----------------------------------------------------------------------------
" deoplete configuration
"----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

"----------------------------------------------------------------------------
" vim-markdown configuration
"--------------------------------------------------------------------------- 
"
let g:vim_markdown_folding_disabled = 1

"----------------------------------------------------------------------------
" markdown-preview.nvim configuration
"----------------------------------------------------------------------------

"let g:mkdp_browser = 'firefox'
"





"----------------------------------------------------------------------------
" ryanoasis/vim-devicons configuration 
"
" NOTE: This soesn't seem to work, so I'm commenting these lines for now.
"---------------------------------------------------------------------------- 

"set! guifont=DroidSansMono\ Nerd\ Font\ 11
"set! gfw=DroidSansMono\ Nerd\ Font\ 11





"---------------------------------------------------------------------------
" Settings to clear checkhealth errors and warnings

" Not using perl. If perl support is needed in future, run :checkhealth
" and follow the advice given in the warning message.
let g:loaded_perl_provider = 0


"----------------------------------------------------------------------------
" General settings
"----------------------------------------------------------------------------
"
set! nocompatible            " disable compatibility to old-time vi
set! showmatch               " show matching
set! ignorecase              " case insensitive by default
set! smartcase!              " case sensitive search if any uppercase chars entered
:map <C-c> :set smartcase!<CR>:set smartcase?<CR> " Toggle smartcase
set! mouse=v                 " middle-click paste with
set! hlsearch                " highlight search
set! incsearch               " incremental search
set! tabstop=4               " number of columns occupied by a tab
set! softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set! expandtab               " converts tabs to white space
set! shiftwidth=4            " width for autoindents
set! autoindent              " indent a new line the same amount as the line just typed
set! number                  " show line numbers in edit buffer
set! wildmode=longest,list   " get bash-like tab completions
set! cc=120                   " set an 120 column visual border
set! tw=120                   "text wrap at 120
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set! mouse=a                 " enable mouse click
set! clipboard=unnamedplus   " using system clipboard
filetype plugin on
set! cursorline              " highlight current cursorline
set! ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
autocmd! BufWritePost *.vim* so $MYVIMRC " Auto reload config file when saved


" " Copy to clipboard
vnoremap  <leader>y  "VV+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set! clipboard+=unnamedplus
