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

	Plug 'morhetz/gruvbox'
	" search files
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" outline
	Plug 'majutsushi/tagbar'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

"	Plug 'preservim/nerdtree'
"	Plug 'sbdchd/neoformat'

call plug#end()

autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox 
