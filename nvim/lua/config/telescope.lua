--   Telescope.nvim Key Maps
local builtin = require('telescope.builtin')
-- Find files by name
vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
-- Search for text inside files (requires ripgrep)
vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- Live grep Search inside the current buffer
vim.keymap.set('n', 'fs', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [B]uffer' })
-- Search through open buffers
vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
-- Search through help tags
vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })
