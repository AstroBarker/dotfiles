" Brandon Barker's neovim config. 
" Feel free to take anything

set number

set notermguicolors
hi Terminal ctermbg=none
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

" Indentation settings -- 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" do NOT expand tabulations in Makefiles:
autocmd FileType make setlocal noexpandtab

" set leader key
nnoremap <SPACE> <Nop>
map <Space> <Leader>

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

" Telescope Required
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Telescope Optional
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

"  devicons
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" git
Plug 'airblade/vim-gitgutter'

" vimtex
Plug 'lervag/vimtex'

"" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn' " <theme> is a valid theme name

" input quotes and brackets as pairs
Plug 'jiangmiao/auto-pairs'
call plug#end()

" theme
colorscheme gruvbox

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Telescope Configs / Extension Settings
lua require("barker")
nnoremap <C-/> <cmd>lua require('barker').curr_buff()<cr>

nnoremap <F4> :lua package.loaded.barker = nil<cr>:source ~/.config/nvim/init.vim<cr>

" LSP
