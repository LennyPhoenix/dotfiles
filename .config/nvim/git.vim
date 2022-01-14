" ==================================
" Configuration and keybinds for git
" ==================================

" Remove default gutter keybinds
let g:gitgutter_map_keys = 0

" GitGutter keybinds
nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>gu :GitGutterUndoHunk<CR>

" Fugitive keybinds
nnoremap <silent> <leader>gg :G<CR>

" WhichKey config
let g:which_key_map.g = { 'name': '+git',
                        \ 'g': 'open fugitive',
												\ 'p': 'preview hunk',
                        \ 's': 'stage hunk',
												\ 'u': 'undo hunk' }
