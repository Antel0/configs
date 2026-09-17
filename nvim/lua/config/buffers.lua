local float = require("src.float")

-- Buffers User Commands
local function delete_no_name_buffers()                                             -- Function to delete all [No Name] buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name == "" then  -- "[No Name]" has an empty name internally
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
  print("Deleted all [No Name] buffers")
end
vim.api.nvim_create_user_command("BuffersPrune", delete_no_name_buffers, {})        -- Deletes all "[No Name]" buffers

local function delete_buffer_by_number()
  local bufnr = vim.fn.input("Buffer number to delete: ")
  if bufnr ~= "" then
      local buftype = vim.api.nvim_buf_get_option(tonumber(bufnr), "buftype")
      if buftype == "terminal" then
          vim.cmd("bd! " .. bufnr)
      else
          vim.cmd("bd " .. bufnr)
      end
  end
end

local function switch2buffer_by_number()
  local bufnr = vim.fn.input("Switch to buffer number : ")
  if bufnr ~= "" then
    vim.cmd("b " .. bufnr)
  end
end

--   Buffer Key Maps
local buffer_lead = "<C-b>" 
vim.keymap.set("n", buffer_lead .. "l", ":buffers<CR>", { noremap = true, silent = false })            -- List open buffers
vim.keymap.set("n", buffer_lead .. "n", ":bn<CR>", { noremap = true, silent = false })                 -- Switch to next buffer
vim.keymap.set("n", buffer_lead .. "p", ":bp<CR>", { noremap = true, silent = false })                 -- Switch to previous buffer
vim.keymap.set("n", buffer_lead .. "s", ":b#<CR>", { noremap = true, silent = false })                 -- Switch to alternate buffer
vim.keymap.set("n", buffer_lead .. "S", switch2buffer_by_number, { noremap = true, silent = false })   -- Switch to buffer by number
vim.keymap.set("n", buffer_lead .. "d", ":bd<CR>", { noremap = true, silent = false })                 -- Delete current buffer
vim.keymap.set("n", buffer_lead .. "D", delete_buffer_by_number, { noremap = true, silent = true })    -- Deletes buffer by number
vim.keymap.set('n', buffer_lead .. "b", float.buffer_navigator, { desc = "Floating Buffer Navigator" })

