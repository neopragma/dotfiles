execute pathogen#infect()

" NeoVim only, not Vim
set nocompatible

" Enable syntax highlighting
syntax on

" Enable filetype-specific plugins and indentation
filetype plugin indent on 

" Enable autocompletion
set omnifunc=syntaxcomplete#Complete

" Have the editor show line numbers
:set number

" Set a color scheme 
colorscheme spacegray 

" Insert spaces for tabs
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Enable deoplete
let g:deoplete#enable_at_startup = 1 

" Have neomake display errors automatically
let g:neomake_open_list = 2

:let mapleader = ","
:let maplocalleader = "\\"

" Split horizontally and open a shell in the lower pane
:nnoremap <leader>o :below 10sp term://$SHELL<cr>i

" ----------------------------------------------------
" vim-javacomplete2 plugin settings
" ----------------------------------------------------

autocmd FileType java setlocal omnifunc=javacomplete#Complete

" smart (trying to guess import option) inserting class imports with F4

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" usual (will ask for import option) inserting class imports with F5

nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" add all missing imports with F6

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" remove all unused imports with F7

nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" default mappings 

nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" ----------------------------------------------------
" NERDTree plugin settings 
" ----------------------------------------------------

" Toggle the nerdtree file browser 
:nnoremap <leader>f :NERDTreeToggle<CR> 

" Close neovim if the only window remaining open is nerdtree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Start nerdtree when no file is specified on neovim start
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 

" Start nerdtree when neovim starts with a directory 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv() 

" Start nerdtree after vim initialization
autocmd VimEnter * NERDTree

" Place cursor in the editor pane rather than the nerdtree pane initially 
autocmd VimEnter * wincmd p

