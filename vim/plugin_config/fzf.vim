command! FzfBranch call fzf#run({
\   'source': ctrlp#branch#init(),
\   'sink': 'edit',
\   'options': '-m -x +s --prompt=Branch:'.shellescape(pathshorten(getcwd())).'/',
\   'down': '40%'
\ })

map <Leader>t :Files<CR>
map <Leader>l :Buffers<CR>
map <Leader>m :GFiles?<CR>
map <Leader>M :FzfBranch<CR>
map <Leader>d :Files %:h<CR>
