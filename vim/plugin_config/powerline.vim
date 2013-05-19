let g:file_modified_segment = ''
function! SetFileModifiedSegment()
  let g:file_modified_segment = system("[[ -n \"$([[ -n " . shellescape(expand("%")) . " ]] && git status --porcelain " . shellescape(expand("%")) . " 2> /dev/null)\" ]] && echo -n +")
endfunction
autocmd BufWritePost * call SetFileModifiedSegment()
autocmd BufEnter * call SetFileModifiedSegment()

call Pl#Theme#InsertSegment(['raw', '%{file_modified_segment}'],  'after', 'lineinfo')
call Pl#Theme#InsertSegment('ws_marker',  'after', 'lineinfo')
