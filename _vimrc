function! CreateDirIfNeeded(dir)
  let needed = !isdirectory(a:dir)
  if needed
    call system('mkdir ' . a:dir)
  endif
  return needed
endfunction


set nocompatible
if has("win32") 
 source $VIMRUNTIME/vimrc_example.vim
endif

let vimdir = '$HOME/.vim'
let &runtimepath.=','.vimdir

"Vundle
filetype off
let vundledir = expand(vimdir . '/bundle/vundle/')
let installVundle = CreateDirIfNeeded(vundledir)
if installVundle
  echo "Installing Vundle"
  call system('git clone https://github.com/gmarik/vundle ' . vundledir)
endif
let &runtimepath.=','.vundledir
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'neilagabriel/vim-geeknote'
Bundle 'altercation/vim-colors-solarized'
Bundle 'dkarter/bullets.vim'

if installVundle > 0
  echo "Installing Vundle Bundles"
  :BundleInstall
endif
filetype plugin indent on

behave xterm
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
colors darkblue
set background=dark 

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
set backspace=indent,eol,start
au BufRead,BufNewFile *.txt set filetype=plaintext
"au FileType plaintext setlocal spelllang=en spell
set spelllang=en

if has("win32") 
    set clipboard=unnamed
    set guifont=Consolas:h9:cEASTEUROPE
    set encoding=cp1250 "the displayed encoding
else
    set clipboard=unnamedplus
    set encoding=utf-8
endif

"nerdtree(tabs) improvements
let g:nerdtree_tabs_open_on_console_startup=1
