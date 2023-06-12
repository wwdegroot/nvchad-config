local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("debugpy")
local venv_path = codelldb:get_install_path()
local python_path = extension_path .. "venv\\Scripts\\python.exe"

return python_path
