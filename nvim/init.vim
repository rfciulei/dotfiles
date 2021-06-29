set mouse=a
set number
set relativenumber
set autoread
set clipboard=unnamedplus               
set updatetime=70                      
set splitbelow                          
set splitright                          
set tabstop=4                           
set shiftwidth=4                        
set termguicolors

source $HOME/.config/nvim/mappings.vim

call plug#begin('~/.vim/plugged')

"	Plug 'morhetz/gruvbox'

	Plug 'arcticicestudio/nord-vim' 
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'

	" linting  
	Plug 'dense-analysis/ale'

	" formatting 
	Plug 'sbdchd/neoformat'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" ------------------ THEME ------------------

" don't override terminal background
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_underline = 1
colorscheme nord 

" gf
let &path.="src/include, /usr/include/"  
" let &path.="src/include, /usr/include/, /usr/lib/python3.8/, /usr/local/lib/python3.8/dist-packages"

" ------------------ DEOPLETE ------------------

let g:deoplete#enable_at_startup=1

" ------------------ LINTING ------------------

let g:ale_linters={'c': ['clang'], 'python3' : ['flake8']}
let g:ale_c_cc_options='-std=gnu11 -Wall -I/usr/include'
let g:ale_pattern_options = {'\.py$': {'ale_enabled': 0}}
let g:ale_pattern_options = {'\.java$': {'ale_enabled': 0}}
let g:ale_pattern_options = {'\.asm$': {'ale_enabled': 0}}

" ------------------ FORMATTING ------------------

let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_c_clangformat = {
	\ 'exe': 'clang-format',
	\ 'args': ['--style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false }"']
\}

let g:neoformat_enabled_python = ['yapf']
let g:neoformat_python_yapf = {
	\ 'exe': 'yapf',
	\ 'args' : ['--style="{based_on_style: google, spaces_before_comment = 1}"']
\ }
