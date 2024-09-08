require "nvchad.options"

-- add yours here!
-- editor options
vim.wo.relativenumber = true
vim.o.incsearch = true
-- shell options
vim.o.shell = "pwsh.exe"

vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"

vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"

vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"

vim.o.shellquote = ""

vim.o.shellxquote = ""
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
