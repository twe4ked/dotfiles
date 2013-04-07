let g:ctrlp_map                   = '<Leader>t'
let g:ctrlp_clear_cache_on_exit   = 1
let g:ctrlp_working_path_mode     = 0 " Handle working path manually
let g:ctrlp_dotfiles              = 0 " Ignore all dot/hidden files
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore         = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|backups$\|logs$\|tmp$\|_site$',
  \ 'file': '',
  \ 'link': '',
  \ }

map <Leader>l :CtrlPBuffer<CR>
map <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>

map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
