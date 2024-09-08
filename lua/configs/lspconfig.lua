-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html", "cssls",
  "gopls", "templ",
  "pyright",
  "ansiblels",
  "dockerls",
  "tsserver", "svelte", "tailwindcss",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  -- workaround for tsserver transition to ts_ls https://github.com/neovim/nvim-lspconfig/pull/3232#issuecomment-2331025714
  if lsp == "tsserver" then
    lsp = "ts_ls"
  end
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
