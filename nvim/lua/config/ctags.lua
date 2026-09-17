-- F12: Jump to definition
vim.keymap.set('n', '<F3>', '<C-]>', { desc = "Jump to Tag Definition" })
vim.keymap.set('i', '<F3>', '<Esc><C-]>', { desc = "Jump to Tag Definition" })
-- F11: Jump back to previous position
vim.keymap.set('n', '<F4>', '<C-t>', { desc = "Jump Back from Tag" })
vim.keymap.set('i', '<F4>', '<Esc><C-t>', { desc = "Jump Back from Tag" })
-- Shift + F12: Show all matching tags (useful if there are multiple definitions)
vim.keymap.set('n', '<F5>', ':tselect <C-R><C-W><CR>', { desc = "Select Tag from List" })
vim.keymap.set('i', '<F5>', '<Esc>:tselect <C-R><C-W><CR>', { desc = "Select Tag from List" })
