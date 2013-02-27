" Plugins-----------------------------------------------------------------------
" Plugin configuration.

" CtrlP
let g:ctrlp_map                   = '<Leader>t'
let g:ctrlp_clear_cache_on_exit   = 1
let g:ctrlp_working_path_mode     = 0 " Handle working path manually
let g:ctrlp_dotfiles              = 0 " Ignore all dot/hidden files
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore         = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|backups$\|logs$\|tmp$',
  \ 'file': '',
  \ 'link': '',
  \ }

" NERDTree
let g:loaded_netrw = 1                      " Disable netrw
let g:loaded_netrwPlugin = 1                " Disable netrw
let g:NERDTreeHijackNetrw = 0               " Hijack netrw
let g:NERDTreeShowLineNumbers = 0           " Disable line numbers
let g:NERDTreeMinimalUI = 1                 " Disable help message
let g:NERDTreeDirArrows = 1                 " Enable directory arrows

" tcomment
let g:tcommentMapLeaderOp1 = '<Leader>c'

" Indent Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

" Colorizer
let g:colorizer_nomap = 1                   " No mappings

" Prevent vim-surround's `ds` from conflicting with bufexplorer
autocmd BufWinEnter \[BufExplorer\] unmap ds
autocmd BufWinLeave \[BufExplorer\] nmap ds <Plug>Dsurround

" Syntastic
let g:syntastic_enable_signs=0

" Bookmarking
noremap <C-Space> :ToggleBookmark<CR>
noremap <C-Up>    :PreviousBookmark<CR>
noremap <C-Down>  :NextBookmark<CR>

autocmd VimEnter * :silent! SetColors bclear_custom solarized_custom jellybeans_custom

" quickfixsigns
autocmd VimEnter * :QuickfixsignsDisable
map <Leader>q :QuickfixsignsToggle<CR>
let g:quickfixsigns_classes = ['vcsdiff']

let g:slime_paste_file = '$HOME/.slime_paste' " default
let g:slime_target = 'tmux'                   " default: 'screen'

" powerline
call Pl#Theme#InsertSegment('ws_marker',  'after', 'lineinfo')

" Neocomplcache
let g:acp_enableAtStartup = 0                        " Disable AutoComplPop
let g:neocomplcache_enable_at_startup = 1            " Use neocomplcache
let g:neocomplcache_enable_smart_case = 1            " Use smartcase
let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion
let g:neocomplcache_enable_underbar_completion = 1   " Use underbar completion
let g:neocomplcache_auto_completion_start_length = 3
" <CR>: close popup and save indent
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" UpAndDown
" Use option-J/K to bubble lines up and down
nmap <silent> ˚ <Plug>upAndDownUp
nmap <silent> ∆ <Plug>upAndDownDown
vmap <silent> ˚ <Plug>upAndDownVisualUp
vmap <silent> ∆ <Plug>upAndDownVisualDown
imap <silent> ˚ <Plug>upAndDownInsertUp
imap <silent> ∆ <Plug>upAndDownInsertDown

" CtrlP
map <Leader>l :CtrlPBuffer<CR>
map <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
map <Leader>m :CtrlPModified<CR>
