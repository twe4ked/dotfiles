let g:ctrlp_extensions = ['funky', 'mark']
nnoremap <Leader>u :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>U :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Only cache if we're over this number of files
let g:ctrlp_use_caching = 2000
