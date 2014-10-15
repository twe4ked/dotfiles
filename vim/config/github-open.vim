" open current file/line on GitHub
command! GitHubOpen execute "silent !git github-url % ".line('.')."| xargs open" | redraw!
