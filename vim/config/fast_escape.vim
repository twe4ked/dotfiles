" Speed up responsiveness of <Esc> in Vim
" This is reportedly caused by powerline (and apparently lightline)
" http://usevim.com/2013/07/24/powerline-escape-fix/
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
