set number
set relativenumber " F2 to toggle in mappings.vim

set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set autoindent                          " Good auto indent
set smartindent                         " Makes indenting smart

set updatetime=100                      " Faster completion
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autoread							" file updates automatically 

" cursor line 
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=236

" KEY MAPPINGS
source $HOME/.config/nvim/mappings.vim

" PLUGINS
call plug#begin('~/.vim/plugged')

	Plug 'itchyny/lightline.vim' " more or less useless
	Plug 'preservim/nerdcommenter' "faster comments across multiple lines -> example : 10j\cc
	Plug 'preservim/nerdtree' " file explorer, might need it sometimes


	Plug 'Shougo/deoplete.nvim', {'do' : 'UpdateRemotePlugins'}
	Plug 'zchee/deoplete-clang'
	Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-10/lib/libclang.so';

call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']}) " not useful for autocomplete




" gruvbox 
colorscheme gruvbox
