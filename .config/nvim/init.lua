require("core.keymaps")
require("core.plugins")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.fzf")
require("mason").setup()
require("core.plugin_config.treesitter")
-- LSP Setup
local lspconfig = require("lspconfig")
require("core.plugin_config.cmp")
require('lspconfig').clangd.setup({})


-- Clangd configuration
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Key mappings, options, etc. go here
    -- Example:
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  end,
  flags = {
    debounce_text_changes = 150,
  },
})









































