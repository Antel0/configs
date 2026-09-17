local macros = {}


macros.esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

--[[        Auto Preload Line Comment macro to @c and Line Uncomment Macro to @d       ]]--
-- @c -> Comments the current Line
-- @d -> Deletes the first word of the line or Uncomments the current Line
vim.api.nvim_create_autocmd("BufEnter", {
  callback = 
  function(args)
    -- do nothing for netrw
    if vim.bo[args.buf].filetype == "netrw" then
      return 
    end

    -- skip buffers without commentstring
    local line_comment_format = vim.bo[args.buf].commentstring
    if not line_comment_format or line_comment_format == "" then
      return 
    end

    local line_comment_format = vim.bo[args.buf].commentstring
    vim.b[args.buf].my_var_line_comment_keyword = line_comment_format:match("^(.*)%%s")

    vim.fn.setreg("c", "I" .. vim.b[args.buf].my_var_line_comment_keyword .. macros.esc)
    vim.fn.setreg("d", "^" .. #vim.b[args.buf].my_var_line_comment_keyword .. "x")
  end,
})

return macros
