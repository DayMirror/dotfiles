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
	Plug 'kien/ctrlp.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'rking/ag.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'vim-scripts/replacewithregister'
	Plug 'christoomey/vim-titlecase'
	Plug 'christoomey/vim-system-copy'
call plug#end()

" Mappings 
map <C-n> :NERDTreeToggle<CR>

" Colorscheme
colorscheme gruvbox
set background=dark
