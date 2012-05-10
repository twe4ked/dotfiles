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

" Disable cursor keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <M-Down> <Nop>
inoremap <M-Left> <Nop>
inoremap <M-Right> <Nop>
noremap <Up> <Esc>
noremap <Down> <Esc>
noremap <Left> <Esc>
noremap <Right> <Esc>
vmap <Up> <Esc><Esc>gv
vmap <Down> <Esc><Esc>gv
vmap <Left> <Esc><Esc>gv
vmap <Right> <Esc><Esc>gv

" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" Use option-J/K to bubble lines up and down
nmap <silent> ˚ <Plug>upAndDownUp
nmap <silent> ∆ <Plug>upAndDownDown
vmap <silent> ˚ <Plug>upAndDownVisualUp
vmap <silent> ∆ <Plug>upAndDownVisualDown
imap <silent> ˚ <Plug>upAndDownInsertUp
imap <silent> ∆ <Plug>upAndDownInsertDown

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
