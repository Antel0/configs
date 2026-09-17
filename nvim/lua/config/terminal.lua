--   Terminal Settings 
vim.opt.shell = "/bin/bash"         -- default shell
vim.api.nvim_create_autocmd("TermOpen", { -- Set options when entering terminal mode
  pattern = "*",
  callback = function()
    vim.opt_local.number = true         
    vim.opt_local.relativenumber = true 
    vim.opt_local.cursorline = true     
    vim.opt_local.foldmethod = "manual" 
  end
})
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true }) -- Remap Esc
