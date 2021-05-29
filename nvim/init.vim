set mouse=a                             
set number
set autoread							 
set clipboard=unnamedplus               
set updatetime=70                      
set cmdheight=6                         
set splitbelow                          
set splitright                          
set t_Co=256                            
set tabstop=4                           
set shiftwidth=4                        
set statusline+=%F  

colorscheme gruvbox 
source $HOME/.config/nvim/mappings.vim

call plug#begin('~/.vim/plugged')
"	Plug 'morhetz/gruvbox'
	" linting  
	Plug 'dense-analysis/ale'
	" formatting 
	Plug 'sbdchd/neoformat'
call plug#end()

let &path.="src/include, /usr/include/ /usr/lib/python3.8/"

" linting 
let g:ale_linters={'c': ['clang']}
let g:ale_c_cc_options='-std=gnu11 -Wall -I/usr/include'
let g:ale_pattern_options = {'\.py$': {'ale_enabled': 0}}

" formatting
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
