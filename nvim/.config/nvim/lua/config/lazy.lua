-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folkelazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blobl:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup mapleader and maplocalleader before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to save other settings (vim.opt)

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- import plugins
    { import = 'plugins' },
  },
  -- Configure any other settings here. See docs.
  -- colorscheme used when installing plugins
  install = { colorscheme = { 'habamax' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
