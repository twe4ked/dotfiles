map <Leader>sd :FixWhitespace<CR>

" Buffer navigation ------------------------------------------------------------
map <Leader>, <C-^>
map <Leader>w :CommandW<CR>
map <Leader>l :CommandTBuffer<CR>

noremap <leader>i :set list!<CR>
nmap <leader>ss :source $HOME/.vimrc<Bar>:source $HOME/.gvimrc<CR>

" Window Navigation ------------------------------------------------------------
" Use ctrl+(h|j|k|j) to move through open windows.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <silent><Leader>/ :nohls<CR>            " Clear search
map <leader>n :NERDTreeToggle<CR>           " NERDTree
map <Leader>w :CommandW<CR>                 " Command W

" Ack with <leader>f
map <Leader>f :Ack!<Space>

" Highlight word at cursor without changing position
nnoremap <leader>h *<C-O>
" Highlight word at cursor and then Ack it.
nnoremap <leader>H *<C-O>:AckFromSearch!<CR>

map <Leader>F :AckFromSearch<CR>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without yanking
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Align Maps (mapping overrides)
map <Leader>At| <Plug>AM_t|
map <Leader>At#   <Plug>AM_t#
map <Leader>At,   <Plug>AM_t,
map <Leader>At:   <Plug>AM_t:
map <Leader>At;   <Plug>AM_t;
map <Leader>At<   <Plug>AM_t<
map <Leader>At=   <Plug>AM_t=
map <Leader>Ats,  <Plug>AM_ts,
map <Leader>Ats:  <Plug>AM_ts:
map <Leader>Ats;  <Plug>AM_ts;
map <Leader>Ats<  <Plug>AM_ts<
map <Leader>Ats=  <Plug>AM_ts=
map <Leader>Aw=   <Plug>AM_w=
map <Leader>At?   <Plug>AM_t?
map <Leader>At~   <Plug>AM_t~
map <Leader>At@   <Plug>AM_t@
map <Leader>Am=   <Plug>AM_m=
map <Leader>Atab  <Plug>AM_tab
map <Leader>Atml  <Plug>AM_tml
map <Leader>Atsp  <Plug>AM_tsp
map <Leader>Atsq  <Plug>AM_tsq
map <Leader>Att   <Plug>AM_tt
