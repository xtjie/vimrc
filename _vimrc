
source $VIMRUNTIME/mswin.vim
behave mswin
" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en

"��������� 
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
"��ע:����ģʽ��: ���� <Tab> ʱʹ�ú��������Ŀո�
"��� 'autoindent' �򿪣�'>' �� '<' ����ʹ�ÿո����������
"'expandtab' ��ʱ��Ҫ����ʵ�ʵ��Ʊ����� CTRL-V<Tab>��
set shiftwidth=2
"��ע:�����Զ�����Ϊ2
set ruler
set autochdir
set scrolloff=7
set laststatus=2
"set statusline=/%F%m%r%h/ %w/ / CWD:/ %r%{CurDir()}%h/ / / Line:/ %l/%L:%c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofen
"��ע:�ر��۵�,�������,���˵Ŀ�����ͬ,���˾����۵��ر�����,
  "���˾�������Ǹ��ϲ���(��������),�������Լ����ð�.
set fdl=0
"��ע:  �����۵�����: ���ڴ˼�����۵��ᱻ�رա�
"���ô�ѡ��Ϊ��ر����е��۵������ߵ����ֹرո��ٵ��۵���


set history=500
"��ע:������ʷ�������,Amir�������������400,̫������,�Ҹĵ�50��,ʵ��
"˵,200��������ǰ,���ù�ʲô����,�Ѿ���ȫ�ǲ�����


" Python �ļ���һ�����ã����粻Ҫ tab ��  
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab  
autocmd FileType python map <F12> :!python %<CR>  
" ѡ��״̬�� Ctrl+c ����  


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
" plugin - NERD_tree.vim ����״��ʽ���ϵͳ�е��ļ���Ŀ¼  
" :ERDtree ��NERD_tree :NERDtreeClose �ر�NERD_tree  
" o �򿪹ر��ļ�����Ŀ¼ t �ڱ�ǩҳ�д�  
" T �ں�̨��ǩҳ�д� ! ִ�д��ļ�  
" p ���ϲ�Ŀ¼ P ����Ŀ¼  
" K ����һ���ڵ� J �����һ���ڵ�  
" u ���ϲ�Ŀ¼ m ��ʾ�ļ�ϵͳ�˵�����ӡ�ɾ�����ƶ�������  
" r �ݹ�ˢ�µ�ǰĿ¼ R �ݹ�ˢ�µ�ǰ��Ŀ¼  
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
"F8�����л���taglist��taglist����� 
let g:Tlist_Ctags_Cmd = $VIM.'\ctags.exe' 
let g:Tlist_Sort_Type = 'name'          "������˳������Ĭ����λ��˳��(order) 
let g:Tlist_Show_One_File = 1           "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ��� 
let g:Tlist_Exit_OnlyWindow = 1         "���taglist���������һ�����ڣ����˳�vim 
lef g:Tlist_File_Fold_Auto_Close = 1    "����겻�ڱ༭�ļ������ʱ��ȫ���۵� 
let g:Tlist_Use_Right_Window = 1        "���Ҳര������ʾtaglist���� 
let g:Tlist_Enable_Fold_Column = 1      "��ʾ�۵����� 

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


