set number
set relativenumber " F2 to toggle in mappings.vim

set cmdheight=4                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
"set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
"set autoindent                          " Good auto indent
set smartindent                         " Makes indenting smart

set updatetime=100                      " Faster completion
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autoread							" file updates automatically 
set statusline+=%F " show full path 

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=236
"se tags+=/usr/include/tags

" KEY MAPPINGS
source $HOME/.config/nvim/mappings.vim

" PLUGINS
call plug#begin('~/.vim/plugged')

	" file explorer
	Plug 'preservim/nerdtree'  

	" theme
	Plug 'morhetz/gruvbox'
	
	" auto-completition
	" TO-DO : replace with YouCompleteMe
	Plug 'Shougo/deoplete.nvim', {'do' : 'UpdateRemotePlugins'}
	Plug 'zchee/deoplete-clang'
	
	" linting  
 	Plug 'dense-analysis/ale'

	" formatting 
	Plug 'sbdchd/neoformat'

call plug#end()

" directories where to search files
"let &path.="src/include, /usr/include/, /usr/src/linux-hwe-5.8-headers-5.8.0-50/include"
let &path.="src/include, /usr/include/"

" DEOPLETE - Autocompletion
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#clang#clang_header="/usr/include/clang/10/include"
let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-10/lib/libclang.so"

call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']}) " not useful for autocomplete

" DENSE-ANALYSIS - Linting 
let g:ale_linters={'c': ['clang']}
"let g:ale_c_clang_options='-std=c11 -Wall -I/usr/include -I/usr/src/linux-hwe-5.8-headers-5.8.0-50/include'
"let g:ale_c_cc_options='-std=c11 -Wall -I/usr/include -I/usr/src/linux-hwe-5.8-headers-5.8.0-50/include'

let g:ale_c_clang_options='-std=c11 -Wall -I/usr/include'
let g:ale_c_cc_options='-std=c11 -Wall -I/usr/include'

let g:ale_c_parse_makefile=1 

" Neoformat - Formatting
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
" linux kernel style format
let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false }"']
\}

" format on save 
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" gruvbox 
colorscheme gruvbox 
