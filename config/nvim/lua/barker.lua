-- Builtin LSP config --
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require "lspconfig"
local lsp_status = require("lsp-status")

local on_attach = function(client)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set("n", "<leader>mv", vim.lsp.buf.rename, {buffer=0})
end

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

-- cmp --
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})


-- Telescope -- 
local action_state = require('telescope.actions.state') -- file lua/telescope/actions/state.lua
require('telescope').setup {
  defaults = {
    prompt_prefix = "> ", 
    mappings = {
      i = {
        ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
      }
      }
    }
}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('coc')

local mappings = {

}
mappings.curr_buff = function() 
  require('telescope.builtin').current_buffer_fuzzy_find(
    {sorting_strategy='ascending'})
end
return mappings
