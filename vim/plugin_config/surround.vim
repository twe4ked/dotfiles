" Prevent vim-surround's `ds` from conflicting with bufexplorer
autocmd BufWinEnter \[BufExplorer\] unmap ds
autocmd BufWinLeave \[BufExplorer\] nmap ds <Plug>Dsurround
