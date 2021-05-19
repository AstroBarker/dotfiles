" Indentation settings -- 2 spaces
set shiftwidth=2
set softtabstop=2
set expandtab

" ===== Plugins ======
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" auto completion

Plug 'davidhalter/jedi-vim'
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let mapleader=","

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
	    Plug 'Shougo/deoplete.nvim'
	      Plug 'roxma/nvim-yarp'
	        Plug 'roxma/vim-hug-neovim-rpc'
	endif
	let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='deus' 
" <theme> is a valid theme name

" input quotes and brackets as pairs
Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme nord

