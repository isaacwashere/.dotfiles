" =====================================================================
" GENERAL
" =====================================================================
" TODO: Improve this:
" - remove redundancies
" - check for better mapping and searching solutions


" If a project has a .vimrc in it, that should take precedence
set exrc

" Use relative line numbering
set relativenumber

" Basic syntax highlighting
syntax on

" Turn off sound effects when get to end of line
set noerrorbells

" tab is only 2 characters
set tabstop=2 

" tab should be only 2 spaces
set softtabstop=2

" arrow should only shift 2 spaces
set shiftwidth=2

" convert tabs to spaces
set expandtab

" do the best you can to indent for me
set smartindent

" better safe than sorry
set nocompatible

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" prettify my line numbers
set nu

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=/private/tmp

" tell vim where to put swap files
set dir=/private/tmp

" while searching, get results 
set incsearch

" give me some space in the column to show error/git signs and signals
set signcolumn=yes

" lol tbh I forgot what this does TODO: look it up
highlight ColorColumn ctermbg=0 guibg=lightgrey

"show whitespaces as a dot
set lcs+=space:·

" enable true colors support
set termguicolors

" show cursor line
set cursorline

" highlight all line numbers
highlight LineNr  ctermfg=grey

" highlight matching brackets
set showmatch

" show the current command
set showcmd

" timeoutlen is used for mapping delays, and ttimeoutlen is used for key code delays
" It might be more reasonable to give ttimeoutlen a more reasonable value, like 10ms,
set timeoutlen=300 ttimeoutlen=10

" ensure enter only adds 2 spaces 
set shiftwidth=2 smarttab

" set encoding to utf8
set encoding=utf8

" set gui options 
set guifont=DejaVu_Sans_Mono_for_Powerline:h12
set guioptions=


" =====================================================================
" Plugins
" =====================================================================


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Search
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'

" Colorschemes
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'

" File Explorer
 Plug 'preservim/nerdtree'

" Bottom status bar line
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

" Git
Plug 'jreybert/vimagit'

" Languages - General
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'

" Linting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'maxmellon/vim-jsx-pretty'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Javascript
Plug 'pangloss/vim-javascript' 

" Personal
Plug 'wakatime/vim-wakatime'
"Plug 'tpope/vim-fireplace'

" Initialize plugin system
call plug#end()


" =====================================================================
" Plugin Settings
" =====================================================================


" One dark is the best 
colorscheme onedark
let g:airline_theme='onedark'

let g:airline_powerline_fonts=1

" ripgrep should detect the root of the project and respect my .gitignore
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split=2
let g:netrw_winsize = 25

" No need to cache (plus it's faster not to)
let g:ctrlp_use_caching=0

" A few things I don't want to search for
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Space is the leader key
let mapleader = " "

" COC Extensions
 let g:coc_global_extensions = [
   \  'coc-css',
   \  'coc-svg',
   \  'coc-json',
   \  'coc-yank',
   \  'coc-html',
   \  'coc-pairs',
   \  'coc-emmet',
   \  'coc-angular',
   \  'coc-tsserver',
   \  'coc-prettier',
   \  'coc-highlight',
   \  'coc-solargraph',
   \  'coc-markdownlint',
   \  'coc-tslint-plugin',
   \ ]

" =====================================================================
" Maps
" =====================================================================


" File save should save files
nnoremap <leader>fs :w<CR>

" Magit
nnoremap <leader>gg :Magit<CR>

" For jumping between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Nerdtree
nnoremap <leader>op :NERDTree<CR>

" For viewing file tree
nnoremap <leader>pv :wincmd v<CR>

" For searching
nnoremap <leader>ps :Rg<SPACE>

" GoTo code navigation COC 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
