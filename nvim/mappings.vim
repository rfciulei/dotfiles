" save files
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR><space>i
vnoremap <c-s> :w<CR>
nnoremap <c-q> :q<CR>
" exit files and save before
"nnoremap <c-w> :wq!<CR>
"inoremap <c-w> <Esc>:wq!<CR>
"vnoremap <c-w> <Esc>:wq!<CR>
" undo 
nnoremap <c-z> <Undo>
" search for regex
nnoremap <c-f> / 
" go to line 
nnoremap <c-g> :
" NERDTree
nnoremap <c-s-e> :NERDTreeToggle<CR>

" alternative to normal mode
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
