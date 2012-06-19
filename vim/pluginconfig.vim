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

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

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

" NERDCommenter
let g:NERDSpaceDelims=1                     " extra spaces

" Bookmarking
noremap <C-Space> :ToggleBookmark<CR>
noremap <C-Up>    :PreviousBookmark<CR>
noremap <C-Down>  :NextBookmark<CR>

autocmd VimEnter * :silent! SetColors bclear_custom solarized_custom jellybeans_custom
