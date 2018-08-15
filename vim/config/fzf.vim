command! FzfBranch call fzf#run({
\   'source': 'git-files-modified-on-branch',
\   'sink': 'edit',
\   'options': '-m +s --prompt="GitBranch> " --preview ''(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500''',
\   'down': '40%'
\ })

map <Leader>t :Files<CR>
map <Leader>l :Buffers<CR>
map <Leader>m :GFiles?<CR>
map <Leader>M :FzfBranch<CR>
map <Leader>d :Files %:h<CR>
