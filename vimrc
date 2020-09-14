" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
" set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set smartindent
set autoindent
set number relativenumber	"show the number of line
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set list
autocmd FileType make set noexpandtab
" exit from insert mode to normal mode
inoremap jk <ESC>
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set fileencodings=utf-8,gb2312,gbk,gb18030  
set termencoding=utf-8  
set fileformats=unix  
set encoding=utf-8 
"""""""""""""""""""""
"vundle change"
"""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Bundle 'tpope/vim-sensible'
Bundle 'bling/vim-airline'
"Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent on
""""""""""""""""""""""
"airline conf"
""""""""""""""""""""""
set t_Co=256
set laststatus=2
"支持powerline字体
let g:airline_powerline_fonts = 1
"显示窗口tab和buffer
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""
"Quickly Compile
""""""""""""""""""""""
"    map <F5> :call CompileRunGcc()<CR>
"    func! CompileRunGcc()
"        exec "w"
"if &filetype == 'c'
"            exec "!g++ % -o %<"
"            exec "!time ./%<"
"elseif &filetype == 'cpp'
"            exec "!g++ % -o %<"
"            exec "!time ./%<"
"elseif &filetype == 'java'
"            exec "!javac %"
"            exec "!time java %<"
"elseif &filetype == 'sh'
"            :!time bash %
"elseif &filetype == 'python'
"            exec "!python %"
"elseif &filetype == 'html'
"            exec "!firefox % &"
"elseif &filetype == 'go'
"    "        exec "!go build %<"
"            exec "!time go run %"
"elseif &filetype == 'mkd'
"            exec "!~/.vim/markdown.pl % > %.html &"
"            exec "!firefox %.html &"
"endif
"    endfunc
"let g:jedi#auto_initialization = 1

"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"""""""""""""""""""""""""""""""
"NERDTree Config
"""""""""""""""""""""""""""""""
map <leader>t :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=30
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" vim不指定具体文件打开是，自动使用nerdtree
" autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif
" 当vim打开一个目录时，nerdtree自动使用
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
"!exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

