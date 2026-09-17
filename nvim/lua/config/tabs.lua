--   Tab Key Maps
local tab_lead = "<C-a>"


-- Close a Tab
vim.api.nvim_set_keymap("n", tab_lead .. "c", ":tabc<CR>", {noremap = true, silent = false})
-- Open a New Tab
vim.api.nvim_set_keymap("n", tab_lead .. "n", ":tabnew<CR>", {noremap = true, silent = false})
-- Move a Tab Left
vim.api.nvim_set_keymap("n", tab_lead .. "h", ":tabmove -1<CR>", {noremap = true, silent = false})
-- Move a Tab Right
vim.api.nvim_set_keymap("n", tab_lead .. "l", ":tabmove +1<CR>", {noremap = true, silent = false})
