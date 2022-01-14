" =======================
" Configuration for C/C++
" =======================

" Keybinds
nmap <silent> <leader>jh :FSHere<cr>
nmap <silent> <leader>jHf :FSHeader<cr>
nmap <silent> <leader>jHh :FSSplitLeft<cr>
nmap <silent> <leader>jHl :FSSplitRight<cr>
nmap <silent> <leader>jHk :FSSplitAbove<cr>
nmap <silent> <leader>jHj :FSSplitBelow<cr>

" Which key config
let g:which_key_map.j.h = 'header/source'
let g:which_key_map.j.H = { 'name': '+headers',
                          \ 'f':    'switch here',
                          \ 'h':    'split left',
                          \ 'l':    'split right',
                          \ 'k':    'split above',
                          \ 'j':    'split below' }
