let g:coc_global_extensions = ['coc-json', 'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-rust-analyzer']

" https://github.com/neoclide/coc.nvim/issues/888#issuecomment-830806261
autocmd BufWritePre *.tsx :silent call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 OR   :silent call CocAction('runCommand', 'editor.action.organizeImport')
