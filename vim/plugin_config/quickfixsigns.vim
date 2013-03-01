autocmd VimEnter * :QuickfixsignsDisable
map <Leader>q :QuickfixsignsToggle<CR>
let g:quickfixsigns_classes = ['vcsdiff']
