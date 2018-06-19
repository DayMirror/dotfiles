" Basic Settings
	set nocompatible

	set noswapfile " disable swap files usage

	set tabstop=2 " witdh of TAB = 2 spaces
	set shiftwidth=2 " width of autoindent is 2 spaces

	syntax on " enable syntax highlighting

	set hlsearch " highlight search matches
	set nohlsearch " auto disable search highlighting after search is finished
	set incsearch " search while typing

	set number
	set relativenumber
	let mapleader="\\"
	set foldmethod=indent

" Plugins settings
	" Airline plugin settings
	let g:airline_theme='simple'
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#enabled=1

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
	Plug 'easymotion/vim-easymotion'
call plug#end()

" Key Mappings 
	nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>
	nnoremap <c-n> :NERDTreeToggle<cr>
	nnoremap <c-I> :PlugInstall<cr>

" Colorscheme
	colorscheme gruvbox
	set background=dark
