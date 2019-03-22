:set tabstop=2 shiftwidth=2 expandtab autoindent number
:set mouse=ar mousemodel=extend
colo delek
syntax on
filetype indent plugin on
nmap <C-n> :NERDTreeToggle<CR>
"let g:deoplete#enable_at_startup = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:airline_theme='one'

call plug#begin()
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'davidhalter/jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdTree'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'terryma/vim-multiple-cursors'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
call plug#end()
