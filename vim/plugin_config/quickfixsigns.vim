map <Leader>q :QuickfixsignsToggle<CR>

let g:quickfixsigns_classes = ['vcsdiff']

autocmd BufRead * call QuickfixsignsUpdate()

" Jump between git diff hunks
nmap [d :silent call quickfixsigns#MoveSigns(-1, '', 1)<CR>
nmap ]d :silent call quickfixsigns#MoveSigns(1, '', 1)<CR>
