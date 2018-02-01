map  <left>   <nop>
map  <right>  <nop>
map  <up>     <nop>
map  <down>   <nop>



" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


inoremap <M-,> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-.> <Right>
inoremap <M-o> <End>
inoremap <M-i> <Home>
imap <c-d> <esc>ddi

let mapleader = "-"
let g:mapleader = "-"

nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>e2  :vsplit $VIM/vimrc_self.vim<cr>
nnoremap <leader>rv  :source $MYVIMRC<cr>
nnoremap <leader>q   :q<cr>
nnoremap <leader>qq  :qa<cr>


inoremap jk    <esc>


"那么这里可以用,w命令来代替:w!命令,亲自试一下,是不是方便多了,手不
nmap <leader>w :w!<cr>


" Insert current date in yyyy-mm-dd format with \d while in insert mode,
inoremap <leader>dd <C-R>=strftime("%Y-%m-%d")<CR>


" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
vnoremap <C-t>     <Esc>:tabnew<CR>

