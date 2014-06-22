function! CreateDirIfNeeded(dir)
  if !isdirectory(a:dir)
    call system('mkdir ' . a:dir)
  endif
endfunction


set nocompatible
if has("win32") 
 source $VIMRUNTIME/vimrc_example.vim
endif


"Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'https://github.com/scrooloose/nerdtree.git'
filetype plugin indent on

behave xterm
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
colors darkblue
set background=dark 

let vimdir = '$HOME/.vim'
let &runtimepath.=','.vimdir

"backup
set nobackup

"swapfile
let mySwapDir = expand(vimdir . '/swap')
call CreateDirIfNeeded(mySwapDir)
let &directory = mySwapDir 

"persistent undo
if has('persistent_undo')
    let myUndoDir = expand(vimdir . '/undo')
    call CreateDirIfNeeded(myUndoDir)
    let &undodir = myUndoDir
    set undofile "save undofile on file close
endif

set fileencoding=utf-8
set fileencodings=utf-8
set ignorecase
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
au BufRead,BufNewFile *.txt set filetype=plaintext
"au FileType plaintext setlocal spelllang=en spell
set spelllang=en

if has("win32") 
    set clipboard=unnamed
    set guifont=Consolas:h9:cEASTEUROPE
    set encoding=cp1250 "utf-8
else
    set clipboard=unnamedplus
    set encoding=utf-8
endif
