
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
	set foldlevel=99 " all unfolded by default

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

	" Syntastic plugin settings
		set statusline+=%#warningmsg#
		set statusline+=%{SyntasticStatuslineFlag()}
		set statusline+=%*
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 0

	" Typescript-Vim plugin settings
		let g:typescript_compiler_binary = 'tsc'
		let g:typescript_compiler_options = ''
		autocmd QuickFixCmdPost [^l]* nested cwindow
		autocmd QuickFixCmdPost    l* nested lwindow
	
" Plugins Manager
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontentent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

" Plugins List
	call plug#begin('~/.vim/bundle')
		Plug 'junegunn/vim-plug' " plugins manager
		Plug 'tpope/vim-repeat' " allows other plugins to support . command
		Plug 'shougo/vimproc.vim', { 'do' : 'make' } " interactive command execution, dependency of tsuquyimi
		Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
		Plug 'tpope/vim-eunuch' " easy access to the most command shell commands (Mkdir, Move, etc)
		Plug 'morhetz/gruvbox' " vim color theme
		Plug 'kien/ctrlp.vim' " fuzzy finder
		Plug 'mileszs/ack.vim' " wrapper for code searching tool (ack or ag) '<c>-f'
		Plug 'wincent/scalpel' "shortcut for replacing a word in a file or selection '<leader>e'
		Plug 'wincent/loupe' " enhanced in-file search (commands like * #)
		Plug 'moll/vim-bbye' " better closing buffers (files)
		Plug 'tpope/vim-fugitive' " access git commands via vim commands
		Plug 'airblade/vim-gitgutter' " show git diff in the left gutter and jump around these changes with ]c [c
		Plug 'tpope/vim-surround' " surround text with parentheses, brackets, etc.
		Plug 'tpope/vim-commentary' " toggle comments with commands gcc and gc<motion>
		Plug 'christoomey/vim-titlecase' " title case text with command 'gt<motion>
		Plug 'christoomey/vim-system-copy' " paste into system clipboard with cp<motion> command
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'easymotion/vim-easymotion' " faster navigation
		"Plug 'tmux-plugins/vim-tmux-focus-events' " restores FocusGained and FocusLost events in terminal vim inside tmux
		Plug 'haya14busa/incsearch.vim' " better incremental search with all matches highlighting
		Plug 'haya14busa/incsearch-fuzzy.vim' " fuzzy incremental search
		Plug 'haya14busa/incsearch-easymotion.vim' " easymotion and incsearch integration
		Plug '/usr/local/opt/fzf'
		Plug 'junegunn/fzf.vim' " integrates vim with fzf cli tool, can do more than CtrlP (ex. :Lines, :Commits)
		Plug 'jeetsukumaran/vim-buffergator' " list all buffers '<leader>b'
		Plug 'justinmk/vim-syntax-extra' " some additional syntax highlighting
		Plug 'ervandew/supertab' " allows usage of <tab> for all insert completion
		Plug 'SirVer/ultisnips' " snippents engine
		Plug 'honza/vim-snippets' " a pack of common snippets for ultisnips
		Plug 'jceb/emmet.snippets' " emmet snippets for ultisnips
		Plug 'mattn/emmet-vim' " independent from ultisnips emmmet functionality
		Plug 'vim-syntastic/syntastic' " powerful syntax checker
		Plug 'quramy/tsuquyomi' " autocompletion and navigation for typescript
		Plug 'Quramy/vim-js-pretty-template' " js tamplate string highlighting
		Plug 'sheerun/vim-polyglot' "	collection of language syntax highlighting plugins
		Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer -cs-completer --js-completer' } " powerful autocomplete engine
	call plug#end()

" Key Mappings 
	" Edit and source vimrc
		nnoremap <leader>ev :vsplit ~/.vimrc<cr>
		nnoremap <leader>sv :source ~/.vimrc<cr>
	
	" Disable highlighting
		nnoremap <leader>n :noh<cr>

	" Reloading file
		nnoremap <leader>r :e<cr>
		nnoremap <leader>R :e!<cr>
	
	" Fix for backspace
		nnoremap <BS> X
		set backspace=indent,eol,start

	" Fix for Space button in insert mode
		" inoremap <C-@> <C-Space>

	" Quickly quit vim
		noremap <leader>q :qall!
		noremap <leader>wq :wqall!

	" Quicly close buffers
		nnoremap <leader>c :Bdelete<cr>
		nnoremap <leader>ac :bufdo :Bdelete<cr>
	
	" Jump around windows
		nnoremap <c-h> <C-w>h
		nnoremap <c-j> <C-w>j
		nnoremap <c-k> <C-w>k
		nnoremap <c-l> <C-w>l

	" Resizing split window
		nnoremap <leader>+ <c-w>5+
		nnoremap <leader>- <c-w>5-
		nnoremap <leader>> <c-w>5>
		nnoremap <leader>< <c-w>5<

	" Cycling through buffers
		nnoremap <c-[> :bprevious<cr>	
		nnoremap <c-]> :bnext<cr>	

	" Show/Hide all hidden symbols
		set listchars=eol:¶,tab:▒░,trail:▓
		nnoremap <leader>ts :set list<cr>
		nnoremap <leader>th :set nolist<cr>

	" Sessions management
		let g:session_dir = '~/.vim/sessions'
		exec 'nnoremap <leader>ss :mks! ' . g:session_dir . '/' . expand('%:p:h:t') . '.vim'
		exec 'nnoremap <leader>rs :so ' . g:session_dir . '/' . expand('%:p:h:t') . '.vim'

	" NerdTree key bindings
		nnoremap <c-n> :NERDTreeToggle<cr>

	" VimPlug key bindings
		nnoremap <leader>PI :PlugInstall<cr>
		snoremap <leader>PU :PlugUpdate<cr>
		snoremap <leader>PC :PlugClean<cr>
	
	" Toggle line comments using vim-commentary binding ('_' actually stands for '/' - vim feature)
		nmap <c-_> gcc

	" Vim-TitleCase key bindings
		nmap <leader>gt <Plug>Titlecase
		vmap <leader>gt <Plug>Titlecase
		nmap <leader>gT <Plug>TitlecaseLine

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

	" Ack.vim key bindings
		noremap <c-f> :Ack! --smart-case -C 0<space>

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

	" YouCompleteMe plugin key binding settings
		let g:ycm_key_list_select_completion=['<c-n>', '<down>']
		let g:ycm_key_list_previous_completion=['<c-p>', '<up>']

	" SuperTab settings
		let g:SuperTabDefaultCompletionType='<c-n>'
	
	" Ultisnips plugin key binding settings
		let g:UltiSnipsExpandTrigger="<tab>"
		let g:UltiSnipsJumpForwardTrigger="<c-j>"
		let g:UltiSnipsJumpBackwardTrigger="<c-k>"
		let g:UltiSnipsListSnippets="<tab>"

" Colorscheme
	colorscheme gruvbox
	set background=dark
