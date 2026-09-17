local M = {}

-- Creates a centered floating window 
function M.float_window(cmd, width, height)
    local buf = vim.api.nvim_create_buf(false, true)

    -- Center vertically and horizontally
    local row = (vim.o.lines - height) / 2
    local col = (vim.o.columns - width) / 2

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    -- Enables line numbers
    vim.wo[win].number = true
    vim.wo[win].relativenumber = true

    vim.cmd("buffer " .. buf)
    vim.cmd(cmd)  
end


function M.buffer_navigator()
    local width = math.ceil(vim.o.columns * 0.6)
    local height = math.ceil(vim.o.lines * 0.4)

    -- 1. Create a "Scratch" buffer for the list
    local buf = vim.api.nvim_create_buf(false, true)
    local bufnr_map = {} 

    -- 2. Function to populate/refresh the list
    local function fill_buffer()
        local buffers = vim.api.nvim_list_bufs()
        local lines = {}
        bufnr_map = {} -- Reset the map

        for _, b in ipairs(buffers) do
            if vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted then
                local name = vim.api.nvim_buf_get_name(b)
                if name == "" then name = "[No Name]" else name = vim.fn.fnamemodify(name, ":p:.") end
                
                -- Add a modified flag [+] if the buffer has unsaved changes
                local modified = vim.bo[b].modified and " [+]" or ""
                table.insert(lines, string.format("%d: %s%s", b, name, modified))
                table.insert(bufnr_map, b)
            end
        end

        vim.bo[buf].modifiable = true
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.bo[buf].modifiable = false
    end

    fill_buffer()

    -- 3. Open the Window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = (vim.o.lines - height) / 2,
        col = (vim.o.columns - width) / 2,
        style = "minimal",
        border = "rounded",
    })

    vim.wo[win].cursorline = true

    -- 4. ACTIONS
    
    -- SELECT: Open buffer and close float
    local function select_buffer()
        local idx = vim.api.nvim_win_get_cursor(0)[1]
        local target = bufnr_map[idx]
        vim.api.nvim_win_close(win, true)
        if target then vim.api.nvim_set_current_buf(target) end
    end

    -- DELETE: Remove buffer and refresh list
    local function delete_buffer()
        local idx = vim.api.nvim_win_get_cursor(0)[1]
        local target = bufnr_map[idx]
        
        if target then
            -- Check if modified to prevent accidental data loss
            if vim.bo[target].modified then
                print("Buffer has unsaved changes! Use :w first.")
                return
            end
            
            vim.api.nvim_buf_delete(target, { force = false })
            fill_buffer() -- Refresh the UI
            
            -- Adjust cursor if we deleted the last line
            local line_count = vim.api.nvim_buf_line_count(buf)
            if idx > line_count and line_count > 0 then
                vim.api.nvim_win_set_cursor(0, {line_count, 0})
            end
        end
    end

    -- 5. KEYMAPS
    local opts = { buffer = buf, noremap = true, silent = true }
    vim.keymap.set('n', '<CR>', select_buffer, opts)
    vim.keymap.set('n', 'd', delete_buffer, opts) -- DELETE BUFFER
    vim.keymap.set('n', 'q', ':close<CR>', opts)
    vim.keymap.set('n', '<Esc>', ':close<CR>', opts)
end

return M
