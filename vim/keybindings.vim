map <Leader>r :checktime<CR>:wall<CR>:redraw!<CR>

" Buffer navigation
map <Leader>, <C-^>
map <silent><Leader>q :Bclose<CR>

noremap <leader>i :set list!<CR>
nmap <leader>ss :source $HOME/.vimrc<CR>

" Clear search
map <silent><Leader>/ :nohls<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" Ack
map <Leader>f :Ack!<Space>
map <Leader>F :AckFromSearch<CR>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without yanking
nmap <silent> <leader>gd "_d
vmap <silent> <leader>gd "_d

" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" I never intentionally lookup keywords (with `man`)
nmap K <Esc>

" Jump to start and end of line using the home row keys
noremap H ^
noremap L $

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" select all
map <Leader>a ggVG

" Toggle word wrap
map <Leader>W :set wrap!<CR>

" Toggle spell checking
map <Leader>S :set spell!<CR>

" Movement & wrapped long lines
" This solves the problem that pressing down jumps your cursor 'over' the
" current line to the next line
nnoremap j gj
nnoremap k gk

nnoremap = v=
