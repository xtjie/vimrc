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
