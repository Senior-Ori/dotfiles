require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "clangd", "rust_analyzer", "tsserver" },
}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs({ "clangd", "tsserver" }) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end
