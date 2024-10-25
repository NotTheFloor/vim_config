vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Cursor centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete rebuffer
vim.keymap.set("x", "<leader>p", "\"_dP")
