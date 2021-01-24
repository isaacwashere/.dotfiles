" =====================================================================
" GENERAL
" =====================================================================
" TODO: Improve this:
" - remove redundancies
" - check for better mapping and searching solutions

" Just a sanity check on encoding, nothing to see here
scriptencoding utf-8
set encoding=utf-8

" better safe than sorry
set nocompatible

" for Vim Wiki
filetype plugin on

" Show whitespaces, tabs, and eol characters
set list listchars=eol:$,tab:».,space:·
" set list listchars=eol:$,tab:».,trail:X,extends:>,precedes:<,space:·

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
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" Colorschemes
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'

" File Explorer
Plug 'scrooloose/nerdtree'

" Bottom status bar line
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" Git
Plug 'jreybert/vimagit'

" Languages - General
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'pechorin/any-jump.vim'
Plug 'vimwiki/vimwiki'

" Linting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ntpeters/vim-better-whitespace'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Javascript
Plug 'pangloss/vim-javascript'

" Personal
Plug 'wakatime/vim-wakatime'

" Initialize plugin system
call plug#end()


" =====================================================================
" Plugin Settings
" =====================================================================


" One dark is the best
set laststatus=2
let g:lightline = {
       \ 'colorscheme': 'onedark',
       \ }
colorscheme onedark

" -----------
" Nerdtree
" -----------

let NERDTreeShowHidden=1

function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction

" -----------
" FZF & RG
" TODO: Make sure this section makes sense
" -----------

" ripgrep should detect the root of the project and respect my .gitignore
if executable('rg')
    let g:rg_derive_root='true'
endif

" Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" Use Ripgrep with CtrlSF for performance
let g:ctrlsf_ackprg = '/usr/bin/rg'

" -----------
" COC
" -----------

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

" -----------
" Vim Wiki
" -----------

  let g:vimwiki_global_ext = 0
  let g:vimwiki_ext2syntax = { '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
  let g:vimwiki_root = '~/vimwiki'
  let g:vimwiki_listsyms = '✗○◐●✓'
  let g:vimwiki_list = [
    \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md' },
    \{'path': '~/vimwiki/air', 'syntax': 'markdown', 'ext': '.md' },
    \{'path': '~/vimwiki/general', 'syntax': 'markdown', 'ext': '.md' },
    \{'path': '~/vimwiki/pinkyup', 'syntax': 'markdown', 'ext': '.md' },
    \{'path': '~/vimwiki/air/fixes', 'syntax': 'markdown', 'ext':'.md'},
    \{'path': '~/vimwiki/air/features', 'syntax': 'markdown', 'ext':'.md' },
    \{'path': '~/vimwiki/pinkyup/fixes', 'syntax': 'markdown', 'ext':'.md' },
    \{'path': '~/vimwiki/pinkyup/features', 'syntax': 'markdown', 'ext': '.md' },
  \ ]


" =====================================================================
" Maps
" =====================================================================


" Space is the leader key
let mapleader = " "

" File save should save files
nnoremap <leader>fs :w<CR>

" Magit
nnoremap <leader>gg :Magit<CR>

" Nerdtree
nnoremap <leader>op ToggleNERDTree()<CR>

" For jumping between windows
nnoremap <leader>gh :wincmd h<CR>
nnoremap <leader>gj :wincmd j<CR>
nnoremap <leader>gk :wincmd k<CR>
nnoremap <leader>gl :wincmd l<CR>

" GoTo code navigation COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" Use fzf for in-buffer search
nmap / :BLines!<CR>

" Use fzf for project-wide search
nmap <leader>/ :Rg!<CR>

" Use fzf for filename search
nmap <leader>ff :Files!<CR>

" Use fzf for an available commands search
nmap cc :Commands!<CR>

" Strip trailing whitespace
nmap sws :StripWhitespace<CR>


" =====================================================================
" Aliases and Commands
" =====================================================================


command! SyncVim execute 'source ~/.vimrc'
