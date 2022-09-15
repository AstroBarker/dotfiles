local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.md([[packadd packer.nvim]])
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
  open_fn = function()
      return require("packer.util").float({ border = "rounded" }) 
  end,
  },
})

-- This file can be loaded by calling `require('packerInit')` from your init.lua

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sleuth'

  --- Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function()
    require("plugins.telescope")
  end,
  }

  --- should really put this in requires..
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- You can alias plugin names
  -- Theme
  use {'morhetz/gruvbox', as = 'gruvbox'}

  --- LSP
  use 'neovim/nvim-lspconfig'
  use ({
    'kabouzeid/nvim-lspinstall',
    config = function()
      require("plugins.lsp")
    end,
  })
---  use ({
---    "williamboman/nvim-lsp-installer"
---  })
  use 'nvim-lua/lsp-status.nvim'
  use({
    'hrsh7th/nvim-cmp',
    config = [[ require("plugins/telescope") ]],
  })
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use({ "jose-elias-alvarez/null-ls.nvim" })

  use 'L3MOn4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  --- alpha
  use({
    "goolord/alpha-nvim",
    config = [[ require("plugins/alpha") ]],
  })
 
  --- git
  use 'airblade/vim-gitgutter'
  
  --- vimtex
  use 'lervag/vimtex'

  --- status bar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- () {} []
  use 'jiangmiao/auto-pairs'


end)
