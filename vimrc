if empty(glob('~/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontentent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --slync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
  Plug 'junegunn/vim-plug'
  Plug 'scrooloose/nerdtree'

call plug#end()
