vim.api.nvim_create_user_command("WEx",                                             -- Saves and goes to Ex Mode                    
    function() 
        vim.cmd("w")
        vim.cmd("Ex")
    end, 
    {}
)                          

vim.api.nvim_create_user_command("YankToFile", function(opts)
  -- 1. Grab text from the unnamed register (or specific register if passed)
  local lines = vim.fn.getreg('"', 1, true)
  if #lines == 0 or (#lines == 1 and lines[1] == "") then
    vim.notify("Yank buffer is empty.", vim.log.levels.WARN)
    return
  end

  -- 2. Helper to write contents and open the file
  local function save_file(filename)
    if not filename or filename:match("^%s*$") then
      vim.notify("Operation cancelled.", vim.log.levels.INFO)
      return
    end

    local filepath = vim.fn.expand(filename)

    -- Check if file exists to prevent accidental overwrite
    if vim.fn.filereadable(filepath) == 1 and not opts.bang then
      vim.notify("File already exists! Use :YankToFile! to overwrite.", vim.log.levels.ERROR)
      return
    end

    -- Write lines to disk
    local file, err = io.open(filepath, "w")
    if not file then
      vim.notify("Failed to write file: " .. tostring(err), vim.log.levels.ERROR)
      return
    end

    for _, line in ipairs(lines) do
      file:write(line .. "\n")
    end
    file:close()

    vim.notify("Created " .. filepath, vim.log.levels.INFO)
    vim.cmd.edit(vim.fn.fnameescape(filepath))
  end

  -- 3. Prompt for name if not provided as a command argument
  if opts.args and opts.args ~= "" then
    save_file(opts.args)
  else
    vim.ui.input({
      prompt = "Save yanked text as: ",
      completion = "file",
    }, save_file)
  end
end, {
  nargs = "?",
  bang = true,
  complete = "file",
  desc = "Save contents of the default yank register to a new file",
})
