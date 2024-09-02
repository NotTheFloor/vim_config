vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Cursor centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete rebuffer
vim.keymap.set("x", "<leader>p", "\"_dP")
