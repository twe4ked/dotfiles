let g:lightline = {
  \ 'component_function': {
  \   'filename': 'LightLineFilename'
  \ }
  \ }

function! LightLineFilename()
  return expand('%')
endfunction
