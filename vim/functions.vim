function! CommandTWithFlush()
  CommandTFlush
  CommandT
endfunction

function! UpdateTags()
  if exists('b:git_dir')
    call system('cd "'.b:git_dir.'/.." && nice /usr/local/bin/ctags --tag-relative -R -f .git/tags --exclude=.git --langmap="ruby:+.rake.builder.rjs" .')
  endif
endfunction
