local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local this_os = vim.loop.os_uname().sysname;


local function get_python_path(workspace)
  -- python venv path to exe based on OS
  if this_os:find "Windows" then
    local ven_path = path.join('Scripts', 'python.exe')
  else
    local ven_path = path.join( 'bin', 'python')
  end

  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry --directory ' .. workspace .. ' env info -p'))
    return path.join(venv, ven_path)
  end

  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, ven_path)
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), ven_path)
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
})