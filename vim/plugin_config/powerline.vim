call Pl#Theme#InsertSegment(['raw', '%{system("[[ -n \"$([[ -n " . shellescape(expand("%")) . " ]] && git status --porcelain " . shellescape(expand("%")) . " 2> /dev/null)\" ]] && echo -n +")}'],  'after', 'lineinfo')
call Pl#Theme#InsertSegment('ws_marker',  'after', 'lineinfo')
