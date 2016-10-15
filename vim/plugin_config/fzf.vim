command! FzfBranch call fzf#run({
\   'source': 'git diff $(git merge-base origin/HEAD HEAD).. --name-only | sort -u | xargs find 2> /dev/null',
\   'sink': 'edit',
\   'options': '-m +s --prompt="GitBranch> "',
\   'down': '40%'
\ })

map <Leader>t :Files<CR>
map <Leader>l :Buffers<CR>
map <Leader>m :GFiles?<CR>
map <Leader>M :FzfBranch<CR>
map <Leader>d :Files %:h<CR>
