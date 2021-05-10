" faster movement
nnoremap <C-l> 10l
nnoremap <C-h> 10h
nnoremap <C-j> 10j
nnoremap <C-k> 10k
inoremap <C-l> 10l
inoremap <C-h> 10h
inoremap <C-j> 10j
inoremap <C-k> 10k
vnoremap <C-l> 10l
vnoremap <C-h> 10h
vnoremap <C-j> 10j
vnoremap <C-k> 10k

" toggle relative numbers 
nnoremap <F2> :set relativenumber!<CR>
inoremap <F2> :set relativenumber!<CR>

" save files
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> :w<CR>
nnoremap <c-q> :q!<CR>

" search for regex 
nnoremap <c-f> /
" go to line 
nnoremap <c-g> :

" NERDTree
"nnoremap <C-s-e> :NERDTreeToggle<CR>

" alternative to normal mode
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

"added :noh to deactivate highlight after search 
nnoremap <C-c> :noh<Esc> 

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

:nnoremap n nzz
:nnoremap N Nzz

