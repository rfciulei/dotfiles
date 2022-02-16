" alternative to normal mode
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

nnoremap <F2> :ALEDetail <CR>
vnoremap <F2> :ALEDetail <CR>

" added :noh to deactivate highlight after search 
nnoremap <C-c> :noh<Esc> 
:nnoremap n nzz
:nnoremap N Nzz

" resize splits -> alt + hjkl  
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>

nnoremap <C-f> :Files <CR>

" cscope
map <F3> :e<CR>:exec("cscope find g ".expand("<cword>"))<CR>
map <A-F3> :vsp <CR>:exec("cscope find g ".expand("<cword>"))<CR>

" ctags
map <F4> :e<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-F4> :vsp<CR>:exec("tag ".expand("<cword>"))<CR>

" nerd tree
map <C-S-e> :NERDTreeFocus<CR>
