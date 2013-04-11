map <Leader>q :QuickfixsignsToggle<CR>

let g:quickfixsigns_classes = ['vcsdiff']

autocmd BufRead * call QuickfixsignsUpdate()

" always display the sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Jump between git diff hunks
nmap [d :silent call quickfixsigns#MoveSigns(-1, '', 1)<CR>
nmap ]d :silent call quickfixsigns#MoveSigns(1, '', 1)<CR>
