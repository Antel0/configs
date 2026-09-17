--   Folds Settings and Autocmds
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 0
vim.api.nvim_create_autocmd("BufWritePost", {   -- Auto-save folds and view settings
  pattern = "*",
  command = "mkview",
})
vim.api.nvim_create_autocmd("BufWinEnter", {    -- Auto-save folds and view settings
  pattern = "*",
  command = "silent! loadview",
})
-- not working :TODO fix this 
vim.api.nvim_create_autocmd("BufFilePost", {    -- Auto-Preserve folds when file path changes (rename/move)
  callback = function()
    local old = vim.v.event.old_name
    local new = vim.api.nvim_buf_get_name(0)

    if not old or old == "" then
      return
    end

    local viewdir = vim.fn.stdpath("state") .. "/view/"
    local function viewname(path)
      return viewdir .. vim.fn.fnamemodify(path, ":p"):gsub("/", "%%")
    end

    local old_view = viewname(old)
    local new_view = viewname(new)

    if vim.fn.filereadable(old_view) == 1 then
      vim.fn.rename(old_view, new_view)
    end
  end,
})
