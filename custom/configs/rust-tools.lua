local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "\\extension\\"
local codelldb_path = extension_path .. "adapter\\codelldb.exe"
local liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path
    )
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
}

return options
