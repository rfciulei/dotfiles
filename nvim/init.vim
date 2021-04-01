set number
set cursorline
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set updatetime=100                      " Faster completion
set clipboard=unnamedplus               " Copy paste between vim and everything else
colorscheme gruvbox

hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=236

" KEY MAPPINGS
source $HOME/.config/nvim/mappings.vim

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', {'do' : 'UpdateRemotePlugins'}
" Plug 'zchee/deoplete-clang'
" Plug 'scrooloose/nerdree'
Plug 'morhetz/gruvbox'

call plug#end()

