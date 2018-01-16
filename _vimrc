
source $VIMRUNTIME/mswin.vim
behave mswin
" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en

"启动后最大化 
au GUIEnter * simalt ~x 

filetype indent on
filetype plugin on

let mapleader = ","
let g:mapleader = ","

source $VIM/vimrc_self.vim

set number
set numberwidth=4
set nocompatible
set autoread
set mouse =a

set noswapfile

syntax on
set tabstop=4
set autoindent  "Auto indent
set smartindent  "Smart indent
set wrap  "Wrap lines
" Use spaces instead of tabs

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set expandtab
"译注:插入模式里: 插入 <Tab> 时使用合适数量的空格。
"如果 'autoindent' 打开，'>' 和 '<' 命令使用空格进行缩进。
"'expandtab' 打开时，要插入实际的制表，可用 CTRL-V<Tab>。
set shiftwidth=2
"译注:设置自动缩进为2
set ruler
set autochdir
set scrolloff=7
set laststatus=2
"set statusline=/%F%m%r%h/ %w/ / CWD:/ %r%{CurDir()}%h/ / / Line:/ %l/%L:%c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofen
"译注:关闭折叠,这个功能,个人的看法不同,有人觉得折叠特别有用,
  "有人觉得这就是个废柴功能(比如作者),具体大家自己斟酌吧.
set fdl=0
"译注:  设置折叠级别: 高于此级别的折叠会被关闭。
"设置此选项为零关闭所有的折叠。更高的数字关闭更少的折叠。


set history=500
"译注:保留历史命令个数,Amir给的命令个数是400,太夸张了,我改到50了,实话
"说,200个命令以前,我用过什么命令,已经完全记不清了


" Python 文件的一般设置，比如不要 tab 等  
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab  
autocmd FileType python map <F12> :!python %<CR>  
" 选中状态下 Ctrl+c 复制  


nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


" vim-plug plugins {
call plug#begin($VIM."/vimfiles/plugged")


" file tree, for preview rather than navigation
Plug 'scrooloose/nerdtree',{ 'on': 'NERDTreeToggle'  }
Plug 'vim-scripts/taglist.vim'

Plug 'scrooloose/nerdcommenter'

" file navigation within project
Plug 'ctrlpvim/ctrlp.vim'
" yankring inside ctrlp, as an extension
"
Plug 'szw/vim-maximizer'

" close quickfix window when quit parent window
"Plug 'romainl/vim-qf'


" similar to sublime's multi cursors, though not quite there
Plug 'terryma/vim-multiple-cursors'

" }

" git integration, :Gvdiff command is extremely useful
Plug 'tpope/vim-fugitive'

" }


" code snippets
Plug 'SirVer/ultisnips' |  Plug 'honza/vim-snippets'

Plug 'davidhalter/jedi-vim'

Plug 'vim-syntastic/syntastic'


" surround stuff with other stuff
Plug 'tpope/vim-surround'

" auto insert close brackets
Plug 'jiangmiao/auto-pairs'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'chriskempson / tomorrow-theme'

" the famous emmet, for html
"Plug 'mattn/emmet-vim'


" highlight csv files
"Plug 'chrisbra/csv.vim'

" vim UI {

"Plug 'altercation/vim-colors-solarized'
" }

call plug#end()
" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <leader>f :CtrlPMRU<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-----------------------------------------------------------------  
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录  
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree  
" o 打开关闭文件或者目录 t 在标签页中打开  
" T 在后台标签页中打开 ! 执行此文件  
" p 到上层目录 P 到根目录  
" K 到第一个节点 J 到最后一个节点  
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）  
" r 递归刷新当前目录 R 递归刷新当前根目录  
"-----------------------------------------------------------------  

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__','\.snippet\~','\~$']
let g:NERDTreeWinSize=35
let NERDTreeShowBookmarks=1
let g:NERDTreeShowLineNumbers=1  
let NERDTreeBookmarksFile= $VIM.'\NerdBookmarks.txt'


map <silent><F2>  :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F8单独切换打开taglist（taglist插件） 
let g:Tlist_Ctags_Cmd = $VIM.'\ctags.exe' 
let g:Tlist_Sort_Type = 'name'          "以名称顺序排序，默认以位置顺序(order) 
let g:Tlist_Show_One_File = 1           "不同时显示多个文件的tag，只显示当前文件的 
let g:Tlist_Exit_OnlyWindow = 1         "如果taglist窗口是最后一个窗口，则退出vim 
lef g:Tlist_File_Fold_Auto_Close = 1    "当光标不在编辑文件里面的时候全部折叠 
let g:Tlist_Use_Right_Window = 1        "在右侧窗口中显示taglist窗口 
let g:Tlist_Enable_Fold_Column = 1      "显示折叠边栏 

let Tlist_Hightlight_Tag_On_BufEnter = 1  
let Tlist_Process_File_Always = 1  
let Tlist_Display_Prototype = 0  
let Tlist_Compact_Format = 1  
  
nmap <F8>  :TlistToggle<CR> 
 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
"let g:syntastic_javascript_checkers = ['jshint']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDComment {
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"}


"Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips","MyUltiSnips"]


