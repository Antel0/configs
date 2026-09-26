-- Jump to definition in this window
vim.keymap.set('n', '<F3>', '<C-]>', { desc = "Jump to Tag Definition" })
vim.keymap.set('i', '<F3>', '<Esc><C-]>', { desc = "Jump to Tag Definition" })
-- Jump back to previous position before jumping to definition
vim.keymap.set('n', '<F4>', '<C-t>', { desc = "Jump Back from Tag" })
vim.keymap.set('i', '<F4>', '<Esc><C-t>', { desc = "Jump Back from Tag" })


-- NOTE: <C-R><C-W> inserts the word under the cursor, <CR> runs the command
-- Show all matching tags (useful if there are multiple definitions)
vim.keymap.set('n', '<F5>', ':tselect <C-R><C-W><CR>', { desc = "Select Tag from List" })
vim.keymap.set('i', '<F5>', '<Esc>:tselect <C-R><C-W><CR>', { desc = "Select Tag from List" })
-- Open definition on a vertical split
vim.keymap.set('n', '<F6>', ':<C-U>vertical stag <C-R><C-W><CR>', { desc = "Open definition in a vertical split" })
vim.keymap.set('i', '<F6>', '<Esc>:<C-U>vertical stag <C-R><C-W><CR>', { desc = "Open definition in a vertical split" })
