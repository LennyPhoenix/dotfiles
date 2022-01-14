" ====================================
" Neovim configuration by LennyPhoenix
" ====================================

set nocompatible

" Remap <leader> to <space>
let g:mapleader = "\<space>"

" Install plugins
runtime plugins.vim

" General config
runtime which_key.vim
runtime general.vim
runtime interface.vim
runtime lsp.vim

" Plugin config
runtime sneak.vim
runtime fzf.vim
runtime git.vim

" Languages
runtime c.vim
runtime markdown.vim
