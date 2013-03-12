let run_bundle_install = 0

if !isdirectory(expand("~/.vim/bundle/vundle/"))
  silent !echo "Installing Vundle..."
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let run_bundle_install = 1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
