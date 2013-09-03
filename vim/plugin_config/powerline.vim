let g:file_modified_segment = ''
function! SetFileModifiedSegment()
  let g:file_modified_segment = system("[[ -n \"$([[ -n " . shellescape(expand("%")) . " ]] && git status --porcelain " . shellescape(expand("%")) . " 2> /dev/null)\" ]] && echo -n +")
endfunction
autocmd BufWritePost * call SetFileModifiedSegment()
autocmd BufEnter * call SetFileModifiedSegment()

call Pl#Theme#InsertSegment(['raw', '%{file_modified_segment}'],  'after', 'lineinfo')
call Pl#Theme#InsertSegment('ws_marker',  'after', 'lineinfo')

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
