" ====================================
" Interface configuration and keybinds
" ====================================

" Dracula theme
colorscheme dracula
highlight Normal    guibg=NONE
hi! link  VertSplit DraculaCyan
" True terminal colours
set termguicolors

" Terminal Mode
tnoremap <C-w>     <C-\><C-n><C-w>
tnoremap <C-space> <C-\><C-n>
au TermOpen             *        setlocal listchars= nonumber norelativenumber
au TermOpen             *        startinsert
au BufWinEnter,WinEnter term://* startinsert
nnoremap <silent> <leader>ot :15split<CR>:terminal<CR>
let g:which_key_map.o.t = 'terminal'

" Scratch Pad
nnoremap <leader>os :Scratch 
let g:which_key_map.o.s = 'scratchpad'

" NNN
lua << EOF
require("nnn").setup({
	picker = {
		style = { border = "single" },
	},
	replace_netrw = "picker",
})
EOF
nnoremap <silent> <leader>on :NnnPicker %:p:h<CR>
let g:which_key_map.o.n = 'nnn' " WhichKey config

" Map <C-h|j|k|l> to window movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Map <C-h|j|k|l> to arrow keys (Insert Mode)
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Buffers
let g:bclose_no_plugin_maps = 1
nmap          <leader>bw :w<CR>
nmap <silent> <leader>bb :Buffers<CR>
nmap <silent> <leader>bd :setl bufhidden=delete<CR>:bnext<CR>
nmap <silent> <leader>bn :bnext<CR>
nmap <silent> <leader>bp :bprevious<CR>
" WhichKey config
let g:which_key_map.b = { 'name': '+buffer',
                        \ 'w':    'write',
                        \ 'b':    'buffers',
												\ 'd':    'delete',
                        \ 'n':    'next',
                        \ 'p':    'previous' }

" Tabs
nmap <silent> <leader>tN :tabnew<CR>
nmap <silent> <leader>tn :tabnext<CR>
nmap <silent> <leader>tp :tabprevious<CR>
nmap <silent> <leader>tk :tabclose<CR>
" Cycle with tab and shift-tab
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>
" WhichKey config
let g:which_key_map.t = { 'name': '+tab',
                        \ 'N':    'new',
                        \ 'n':    'next',
                        \ 'p':    'previous',
                        \ 'k':    'kill' }
