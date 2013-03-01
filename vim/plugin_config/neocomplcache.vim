let g:acp_enableAtStartup = 0                        " Disable AutoComplPop
let g:neocomplcache_enable_at_startup = 1            " Use neocomplcache
let g:neocomplcache_enable_smart_case = 1            " Use smartcase
let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion
let g:neocomplcache_enable_underbar_completion = 1   " Use underbar completion
let g:neocomplcache_auto_completion_start_length = 3
" <CR>: close popup and save indent
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
