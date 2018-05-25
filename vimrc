" Basic 
set nocompatible
set noswapfile
set tabstop=2
syntax on
set hlsearch
set nohlsearch
set incsearch
set number
set relativenumber
let g:airline_theme='simple'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let mapleader="\\"

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
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Mappings 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <c-n> :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Colorscheme
colorscheme gruvbox
set background=dark
