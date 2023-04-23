set mouse=a
set number
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnamed register
set updatetime=70
set paste!
set hlsearch
set splitbelow
set splitright
set guitablabel=%N\ %f
set listchars=tab:»\ ,trail:·,nbsp:·,space:·,eol:↲
set fileformats=unix
set list

" mappings 
nnoremap <C-l> 10l
nnoremap <C-h> 10h
nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-l> 10l
vnoremap <C-h> 10h
vnoremap <C-j> 10j
vnoremap <C-k> 10k

nnoremap <C-c> <ESC>:noh<CR>
vnoremap <C-c> <ESC>:noh<CR>

nnoremap <C-f> :Files /Users/roar/fun/git/linux-stable<CR>
vnoremap <C-f> :Files /Users/roar/fun/git/linux-stable<CR>

nmap y "*y
vmap y "*y
nmap <leader>p "*p
nmap <leader>p "*p

call plug#begin('~/.vim/plugged')
    " search files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	Plug 'jremmen/vim-ripgrep'
    Plug 'chiel92/vim-autoformat'
	Plug 'morhetz/gruvbox'
call plug#end()

let &path.="/usr/local/include, /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"


" gruvbox options
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
colorscheme gruvbox
