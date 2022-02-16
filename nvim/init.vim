set mouse=a
set number
set autoread
set clipboard=unnamedplus               
set updatetime=70
set splitbelow                          
set splitright                          
set tabstop=4                           
set shiftwidth=4                        
set termguicolors
set guitablabel=%t

source $HOME/.config/nvim/mappings.vim

call plug#begin('~/.vim/plugged')

	Plug 'arcticicestudio/nord-vim'

	" formatting 
	Plug 'sbdchd/neoformat'

	" search files
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'majutsushi/tagbar'

	Plug 'preservim/nerdtree'

call plug#end()

autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_underline = 1
colorscheme nord 

cs add $CSCOPE_DB
