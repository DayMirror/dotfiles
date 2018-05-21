" Basic 
set nocompatible
set number
set tabstop=2
syntax on
set hlsearch
set incsearch

" Plugins Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontentent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins List
call plug#begin('~/.vim/bundle')
  Plug 'junegunn/vim-plug'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
	Plug 'morhetz/gruvbox'
call plug#end()

" Mappings 
map <C-n> :NERDTreeToggle<CR>

" Colorscheme
"colorscheme gruvbox
"set background=dark
