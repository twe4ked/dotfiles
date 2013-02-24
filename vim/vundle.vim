set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Misc.
Bundle 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-command-w'
Bundle 'tpope/vim-fugitive'
Bundle 'sickill/vim-pasta'
Bundle 'bufkill.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-eunuch'

" tmux
Bundle 'jpalardy/vim-slime'
Bundle 'benmills/vimux'

" Visual
Bundle 'dterei/VimBookmarking'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'skammer/vim-css-color'

" Editing
Bundle 'godlygeek/tabular'
Bundle 'twe4ked/vim-diff-toggle'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/upAndDown'
Bundle 'Shougo/neocomplcache'

" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'jasoncodes/ctrlp-modified.vim'
Bundle 'bufexplorer.zip'
Bundle 'mileszs/ack.vim'

" Language
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'

" Colours
Bundle 'twe4ked/vim-colorscheme-switcher'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'bclear'
