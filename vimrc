" Basic Settings
	set nocompatible

	set noswapfile " disable swap files usage

	set tabstop=2 " witdh of TAB = 2 spaces
	set shiftwidth=2 " width of autoindent is 2 spaces

	syntax on " enable syntax highlighting

	set hlsearch " highlight search matches
	set incsearch " search while typing
	set ignorecase " case insensetive incremental search
	set smartcase " switch to case sensetive search if pattern contains title case characters

	set number
	set relativenumber

	set mousemodel=extend

	set autoindent " keep indent level when moving to the next line
	set foldmethod=indent

" Plugins settings
	" Airline plugin settings
		let g:airline_theme='simple'
		let g:airline_powerline_fonts=1
		let g:airline#extensions#tabline#enabled=1

	" EasyMotion plugin settings
		let g:EasyMotion_smartcase = 1 " use smart case for search

	" Vim-TitleCase plugin settings
		let g:titlecase_map_keys = 0 " do not map default key bindings
	
	" Vim-Airline plugin settings
		let g:airline#extensions#tabline#enabled = 1 " display all buffers if one tab is open

	" Ultisnips plugin settings
		let g:gUltiSnipsExpandTrigger="<c-cr>" " trigger snippet
		let g:UltiSnipsJumpForwardTrigger="<c-]>"
		let g:gUltiSnipsJumpBackwardTrigger="<c-[>"

	" Syntastic plugin settings
		set statusline+=%#warningmsg#
		set statusline+=%{SyntasticStatuslineFlag()}
		set statusline+=%*
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 0
	
" Plugins Manager
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontentent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

" Plugins List
	call plug#begin('~/.vim/bundle')
		Plug 'junegunn/vim-plug' " plugins manager
		Plug 'tpope/vim-repeat' " enables other plugins to support . command
		Plug 'shougo/vimproc.vim', { 'do' : 'make' } " interactive command execution, dependency of tsuquyimi
		Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
		Plug 'morhetz/gruvbox' " vim color theme
		Plug 'kien/ctrlp.vim' " fuzzy finder
		Plug 'tpope/vim-fugitive' " access git commands via vim commands
		Plug 'airblade/vim-gitgutter' " show git diff in the left gutter and jump around these changes with ]c [c
		Plug 'tpope/vim-surround' " surround text with parentheses, brackets, etc.
		Plug 'tpope/vim-commentary' " comment text
		Plug 'christoomey/vim-titlecase' " title case text
		Plug 'christoomey/vim-system-copy' " paste into system clipboard with cp<motion> command
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'easymotion/vim-easymotion' " faster navigation
		Plug 'haya14busa/incsearch.vim' " better incremental search with all matches highlighting
		Plug 'haya14busa/incsearch-fuzzy.vim' " fuzzy incremental search
		Plug 'haya14busa/incsearch-easymotion.vim' " easymotion and incsearch integration
		Plug 'junegunn/fzf.vim' " integrates vim with fzf cli tooll
		Plug 'honza/vim-snippets' " a pack of common snippets for ultisnips
		Plug 'vim-syntastic/syntastic' " powerful syntax checker
		Plug 'quramy/tsuquyomi', { 'for' : ['ts', 'js'] } " autocompletion and navigation for typescript
		Plug 'leafgarland/typescript-vim', { 'for' : ['ts', 'js'] } " typescript syntax highlighting and something else
	call plug#end()

" Key Mappings 
	" Edit and source vimrc
		nnoremap <leader>ev :vsplit ~/.vimrc<cr>
		nnoremap <leader>sv :source ~/.vimrc<cr>

	" NerdTree key bindings
		nnoremap <c-n> :NERDTreeToggle<cr>

	" VimPlug key bindings
		nnoremap <leader><c-I> :PlugInstall<cr>

	" Vim-TitleCase key bindings
		nnoremap <leader>gt <Plug>Titlecase
		vnoremap <leader>gt <Plug>Titlecase
		nnoremap <leader>gT <Plug>TitlecaseLine

	" Incsearch key bindings
		map / <Plug>(incsearch-forward)
		map ? <Plug>(incsearch-backward)
		map g/ <Plug>(incsearch-stay)
		let g:incsearch#auto_nohlsearch = 1
		map n  <Plug>(incsearch-nohl-n)
		map N  <Plug>(incsearch-nohl-N)
		map *  <Plug>(incsearch-nohl-*)
		map #  <Plug>(incsearch-nohl-#)
		map g* <Plug>(incsearch-nohl-g*)
		map g# <Plug>(incsearch-nohl-g#)

	" Fuzzy incsearch key bindings
		map z/ <Plug>(incsearch-fuzzy-/)
		map z? <Plug>(incsearch-fuzzy-?)
		map zg/ <Plug>(incsearch-fuzzy-stay) 

	" Easy Motion key bindings
		map <Leader> <Plug>(easymotion-prefix)
		map <leader>f <Plug>(easymotion-bd-f2)
		map <leader>F <Plug>(easymotion-overwin-f2)
		map <leader>w <Plug>(easymotion-bd-w)
		map <leader>W <Plug>(easymotion-overwin-w)
		map <leader>l <Plug>(easymotion-lineforward)
		map <leader>j <Plug>(easymotion-j)
		map <leader>k <Plug>(easymotion-k)
		map <leader>h <Plug>(easymotion-linebackward)
	
	" Incsearch-EasyMotion key bindings
		map <leader>/ <Plug>(incsearch-easymotion-/)
		map <leader>? <Plug>(incsearch-easymotion-?)
		map <leader>g/ <Plug>(incsearch-easymotion-stay) " search without moving cursor
	
" Colorscheme
	colorscheme gruvbox
	set background=dark
