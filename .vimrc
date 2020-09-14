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
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set smartindent
set autoindent
set number		"show the number of line
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list
autocmd FileType make set noexpandtab

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

Bundle 'tpope/vim-sensible'
Bundle 'bling/vim-airline'
Bundle 'davidhalter/jedi-vim'
Bundle 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent on
""""""""""""""""""""""
"airline conf"
""""""""""""""""""""""
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""
"Quickly 
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
let g:jedi#auto_initialization = 1

"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
