" ======================
" WhichKey configuration
" ======================

" Map WhichKey leaders
nnoremap <silent> <C-space> :<c-u>WhichKey ''<CR>
nnoremap <silent> <leader>  :<c-u>WhichKey '<space>'<CR>

" Create map to add keys to
let g:which_key_map = {}
" Define a separator
let g:which_key_sep = '→'
" Reduce timeout
set timeoutlen=1000

" Do not use a floating window
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Register keymap
call which_key#register('<space>', 'g:which_key_map')
