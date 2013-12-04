nmap ]d <Plug>GitGutterNextHunk
nmap [d <Plug>GitGutterPrevHunk

" always display the sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
