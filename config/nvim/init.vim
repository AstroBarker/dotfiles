set number


set notermguicolors
hi Terminal ctermbg=none
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

" Indentation settings -- 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" do NOT expand tabulations in Makefiles:
autocmd FileType make setlocal noexpandtab

" ===== Plugins ======
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Style plugins
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

" auto completion

" Plug 'davidhalter/jedi-vim'
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let mapleader=","

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  else
"	    Plug 'Shougo/deoplete.nvim'
"	    Plug 'roxma/nvim-yarp'
"	    Plug 'roxma/vim-hug-neovim-rpc'
"	endif
"	let g:deoplete#enable_at_startup = 1
" Plug 'zchee/deoplete-jedi'
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'nvim-treesitter/nvim-treesitter' ", {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"fzf tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git
Plug 'airblade/vim-gitgutter'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn' " <theme> is a valid theme name

" input quotes and brackets as pairs
Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme gruvbox
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>fr <cmd>Files<cr>
