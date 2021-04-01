set number

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=236

" save files
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR><space>i
vnoremap <c-s> :w<CR>
nnoremap <c-q> :q<CR>

" exit files and save before
nnoremap <c-w> :wq!<CR>
inoremap <c-w> <Esc>:wq!<CR>
vnoremap <c-w> <Esc>:wq!<CR>

" undo 
nnoremap <c-z> <Undo>

" search for regex
nnoremap <c-f> / 

" go to line 
nnoremap <c-g> :

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

Plug 'Shougo/deoplete.nvim', {'do' : 'UpdateRemotePlugins'}
Plug 'zchee/deoplete-clang'

Plug 'scrooloose/nerdtree'

call plug#end()

nnoremap <c-s-e> :NERDTreeToggle<CR>
