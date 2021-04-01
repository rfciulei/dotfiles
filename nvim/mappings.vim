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
" NERDTree
nnoremap <c-s-e> :NERDTreeToggle<CR>

