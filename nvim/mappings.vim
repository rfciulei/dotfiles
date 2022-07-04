nnoremap <C-l> 10l
nnoremap <C-h> 10h
nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-l> 10l
vnoremap <C-h> 10h
vnoremap <C-j> 10j
vnoremap <C-k> 10k

nnoremap <F2> :ALEDetail <CR>
vnoremap <F2> :ALEDetail <CR>

nnoremap <F8> :TagbarToggle <CR>
vnoremap <F8> :TagbarToggle <CR>

" added :noh to deactivate highlight after search 
nnoremap <C-c> :noh<Esc> 
:nnoremap n nzz
:nnoremap N Nzz

" resize splits -> alt + hjkl  
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>

nnoremap <C-f> :Files  $HOME/coconut/git/linux<CR>

" cscope
map <F3> :e<CR>:exec("cscope find g ".expand("<cword>"))<CR>
map <A-F3> :vsp <CR>:exec("cscope find g ".expand("<cword>"))<CR>

" ctags
" map <F4> :e<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-F4> :vsp<CR>:exec("tag ".expand("<cword>"))<CR>

" nerd tree
map <C-S-e> :NERDTreeFocus<CR>

" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko
