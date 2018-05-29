" turn on spell check in Git commits.
autocmd FileType gitcommit set spell

" save on FocusLost
autocmd FocusLost * nested :silent! wall

" return to normal mode on FocustLost
autocmd FocusLost * call feedkeys("\<C-\>\<C-n>")

" treat dasherised words as whole words in stylesheets
autocmd Filetype css,scss,sass setlocal iskeyword+=-

function! WhatTheSize()
  execute ":!identify % | cut -d' ' -f 3"
endfunction
autocmd BufEnter *.jpg,*.png call WhatTheSize()

" Set colorcolumn to the current textwidth or fallback to the specified column.
function! ColorColumnAtTextWidth(column)
  if &textwidth > 0
    execute ':set cc=' . &textwidth
  else
    execute ':set cc=' . a:column
  endif
endfunction

" Set colorcolumn to the current textwidth or fallback to 80
autocmd BufWinEnter * call ColorColumnAtTextWidth(80)
