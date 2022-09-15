local vim = vim
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.shell = "/bin/zsh"

vim.api.nvim_command([[
exec "set notermguicolors"
exec "hi Terminal ctermbg=none"
exec "autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE"
exec "autocmd FileType make setlocal noexpandtab"
exec "colorscheme gruvbox"
]])
