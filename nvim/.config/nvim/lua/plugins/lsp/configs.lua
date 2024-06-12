local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

---local on_attach = function(client)
---  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
---  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
---  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
---  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
---  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer=0})
---  vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
---  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer=0})
---  vim.keymap.set("n", "<leader>mv", vim.lsp.buf.rename, {buffer=0})
---end

local servers = {
  "jsonls", 
  "sumneko_lua",
  "html",
  "ccls",
  "python-lsp-server",
  "bashls",
  "tsserver",
	--[[ "csharp_ls" ]]
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end

