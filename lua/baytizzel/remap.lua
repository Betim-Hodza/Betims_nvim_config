vim.g.mapleader = " "
local map = vim.keymap.set

local telescope = require('telescope.builtin')

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format File" })
map("n", "<leader>pv", vim.cmd.NvimTreeToggle, { desc = "open file exlporer"})
map("n", "<leader>ff", telescope.find_files, { desc = "find file"})
map("n", "<leader>fg", telescope.live_grep, { desc = "live grep"})
map("n", "<leader>fh", telescope.help_tags, { desc = "help tag"})


