" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number relativenumber " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
" set t_Co=256
" filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim





" Disable compatibility with vi (which can cause unexpected issues
set nocompatible

" VimPlug plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

    Plug 'morhetz/gruvbox'


    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "Plug 'neovim/nvim-lspconfig'

    " Allows you to jump anywhere in a document with as few keystrokes as possible
    " Plug 'phaazon/hop.nvim'

    " A blazing fast and easy to configure Neovim statusline written in Lua
    Plug 'nvim-lualine/lualine.nvim'

    " If you want to have icons in your statusline choose one of these
    Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'ryanoasis/vim-devicons'

    " Adds indentation guides to all lines
    Plug 'lukas-reineke/indent-blankline.nvim'

    " Tab manager
    Plug 'romgrk/barbar.nvim'

    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle'}

    " Comment out lines using 'gcc'
    Plug 'tpope/vim-commentary'

    Plug 'tmhedberg/SimpylFold'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

    Plug 'preservim/vim-pencil'

    Plug 'jiangmiao/auto-pairs'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'mattn/emmet-vim'
    Plug 'luochen1990/rainbow'

    Plug 'tpope/vim-fugitive'
    Plug 'preservim/tagbar'

    " fzf fuzzy file search
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    Plug 'ggandor/leap.nvim'

    " A collection of language packs for Vim
    Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()





" Settings for Plugins

set termguicolors
colorscheme gruvbox
set background=dark
" set bg=light
let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast_light="soft"
hi Normal guibg=NONE ctermbg=NONE

let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

let g:rainbow_active = 1 "or set to 0 & enable later via :RainbowToggle"

let g:tagbar_show_tag_linenumbers = 1
nmap <F8> :TagbarToggle<CR>
nmap TT :TagbarToggle<CR>

" for nerdcommenter
filetype plugin on

lua require('leap').add_default_mappings()


augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('indent_blankline').setup()

END

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

