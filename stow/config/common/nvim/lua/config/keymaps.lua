local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Write" })
map("n", "<leader>q", "<cmd>wq<cr>", { desc = "Save & Quit" })
map("n", "<leader>Q", "<cmd>q<cr>", { desc = "Quit" })
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("n", "i", "zzi", { desc = "Center line and insert" })

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- keep selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move lines
map("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- diagnostics (LSP maps like K, gd, grn, gra, grr come from nvim defaults / lsp.lua)
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
