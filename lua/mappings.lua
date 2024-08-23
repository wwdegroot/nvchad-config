require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- selection mappings
map("n", "<leader>L", "vg_", { desc = "Select to end of line" })
map("n", "<leader>pa", "ggVGp", { desc = "Select all and paste"})
map("n", "<leader>sa", "ggVG", { desc = "Select all"})
map("n", "<leader>gp", "`[v`]", { desc = "Select pasted text"})
-- scroll with center screen
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center"})
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center"})
map("n", "n", "nzzzv", { desc = "keep cursor in center"})
map("n", "N", "Nzzzv", { desc = "keep cursor in center"})
-- remap backspace to ^
map("n", "<BS>", "^", { desc = "Move to first non-blank character"})
-- move current line/selection up/down
map("n", "<leader>mj", "<cmd>m .+1<CR>==", {desc = "Move line down"})
map("n", "<leader>mk", "<cmd>m .-2<CR>==", {desc = "Move line up"})
map("v", "<leader>mj", "<cmd>m '>+1<CR>gv=gv", {desc = "Move line down in visual mode"})
map("v", "<leader>mk", "<cmd>m '<-2<CR>gv=gv", {desc = "Move line up in visual mode"})
-- search and replace
map("n", "<leader>ss", ":s/\\v", { desc = "search and replace on line"})
map("n", "<leader>SS", ":%s/\\v", { desc = "search and replace on line"})
-- yank and put mappings
map("i", "<C-p>", function()
  require("telescope.builtin").registers()
end, { remap = true, silent = false, desc = " and paste register in insert mode", })
map("n", "<leader>yf", ":%y<cr>", { desc = "yank current file to the clipboard buffer"})
-- blackhole file content
map("n", "<leader>df", "<cmd>%d_<cr>", { desc = "delete file content to black hole register"})
-- copy full file path and name
--
map("n", "<leader>cpf", '<cmd>let @+ = expand("%:p")<cr><cmd>lua print("Copied path to: " .. vim.fn.expand("%:p"))<cr>', { desc = "Copy current file name and path", silent = false})
