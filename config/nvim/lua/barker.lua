-- Builtin LSP config --
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require "lspconfig"
local lsp_status = require("lsp-status")

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
    "gopls",
    "dockerls",
    "tsserver",
    "bashls",
    "cmake",
    "pyright",
    "rust_analyzer",
    "ccls"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
    }
end
