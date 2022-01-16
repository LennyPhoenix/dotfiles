" =================
" Plugin management
" =================

" Ensure vim-plug is installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !wget -P ~/.config/nvim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin plugin list
call plug#begin()

" Theme
Plug 'LennyPhoenix/sweet_dracula_vim', {'as': 'dracula-theme'}

" Dashboard
Plug 'mhinz/vim-startify'

" Modeline
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'github/copilot.vim'

" Files
Plug 'wangy412/nvim-scratchpad'
Plug 'junegunn/fzf.vim'
Plug 'luukvbaal/nnn.nvim'
Plug 'airblade/vim-rooter'

" C/C++
Plug 'derekwyatt/vim-fswitch'

" Markdown
Plug 'godlygeek/tabular' " Dependency for vim-markdown
Plug 'plasticboy/vim-markdown'

" Sneak
Plug 'justinmk/vim-sneak'

" Wakatime tracking and Discord RPC
Plug 'wakatime/vim-wakatime'
Plug 'vimsence/vimsence'

" Devicons
Plug 'ryanoasis/vim-devicons'

" End plugin list
call plug#end()
