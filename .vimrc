" Vim-plug manager section for a0dding 0new plug-ins
"

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle'} 
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'preservim/tagbar'
    " Plug 'craigemery/vim-autotag'
    Plug 'tmhedberg/SimpylFold'
    Plug 'jiangmiao/auto-pairs'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'mattn/emmet-vim'
    Plug 'luochen1990/rainbow'
    Plug 'Yggdroot/indentLine'
    Plug 'pangloss/vim-javascript'
    Plug 'easymotion/vim-easymotion'
    " Plug 'puremourning/vimspector'
    
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"   ## Themes
    Plug 'vim-syntastic/syntastic'
    " Plug 'morhetz/gruvbox'
    Plug 'NLKNguyen/papercolor-theme'

"   ## Deleted 
"   -- coz it reassigns f (find)
"   Plug 'vim-scripts/Efficient-python-folding'

call plug#end()

" Settings for Plugins
set termguicolors
set background=dark
" set bg=light

" colorscheme gruvbox
" let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast_light="soft"
colorscheme PaperColor

  

let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 
" let g:airline_theme='gruvbox'
let g:airline_theme='onedark'

" https://github.com/craigemery/vim-autotag#macos-python-38-and-spawn
let g:autotagStartMethod='fork'
let g:rainbow_active = 1 "or set to 0 & enable later via :RainbowToggle"

" let g:vimspector_enable_mappings = 'HUMAN'


" Disable compatibility with vi (which can cause unexpected issues
set nocompatible

" Enable type file detection: load plugins, indent files  for detected file type.
filetype on
filetype plugin on
filetype indent on

" Turn syntax highlighting & line numbers on.
syntax on
set number

" Set ctags file (for code completion)
set tags+=$HOME/coding/tags

" Set auto complete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" From https://jeffkreeftmeijer.com/vim-number/
" In this example, both absolute and relative line numbers are enabled by
" default, which produces “hybrid” line numbers. When entering insert mode,
" relative line numbers are turned off, leaving absolute line numbers turned on.
" This also happens when the buffer loses focus, so you can glance back at it to
" see which absolute line you were working on if you need to.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Highlight cursor line underneath the cursor horizontally & vertically.
" set cursorline
" set cursorcolumn

" Set shift width to 4 spaces, tab width to 4 cols & use spaces not tabs.
set shiftwidth=4
set tabstop=4
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap

" Set lines to wrap at 80 chars
set tw=80

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search & highligh matches.
set showmatch
set hlsearch

" set rtp+=/usr/local/opt/fzf

" ------------------For Syntastic (https://github.com/vim-syntastic/syntastic)
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8','pylint']

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

" -----------------For Solarized
"
" syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

" a special fold column on the left that indicates open and closed folds
set foldcolumn=2

" -----------------To make active window more obvious
" see:
" https://superuser.com/questions/385553/making-the-active-window-in-vim-more-obvious
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber
augroup END

"highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray

" from https://www.maketecheasier.com/turn-vim-word-processor/
func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()


