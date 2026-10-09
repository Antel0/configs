marks_float_menu = function()
    local local_marks = vim.fn.getmarklist(vim.api.nvim_get_current_buf())
    local global_marks = vim.fn.getmarklist()
    
    local lines = {}
    local mark_map = {} -- Stores the actual mark char for each line index

    -- Helper to filter and format
    local function process_marks(list)
        for _, m in ipairs(list) do
            local char = m.mark:sub(2)
            if char:match("[a-zA-Z0-9]") then
                local line_num = m.pos[2]
                local file = m.file and vim.fn.fnamemodify(m.file, ":t") or "current"
                
                local display_line = string.format("  %s : Line %d [%s]", char, line_num, file)
                table.insert(lines, display_line)
                table.insert(mark_map, char) -- Map this line to the mark character
            end
        end
    end

    process_marks(local_marks)
    process_marks(global_marks)

    if #lines == 0 then 
        print("No user marks found")
        return 
    end

    -- Window setup
    local width = 50
    local height = #lines
    local ui = vim.api.nvim_list_uis()[1]
    local opts = {
        relative = "editor",
        width = width, height = height,
        col = (ui.width - width) / 2, row = (ui.height - height) / 2,
        style = "minimal", border = "rounded",
    }

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- JUMP FUNCTION
    local function jump_to_mark()
        local cursor_line = vim.fn.line('.')
        local target_mark = mark_map[cursor_line]
        
        if target_mark then
            vim.api.nvim_win_close(win, true)
            -- Use ' to jump to the mark
            vim.cmd("normal! '" .. target_mark)
        end
    end

    -- Mappings inside the floating buffer
    local map_opts = { buffer = buf, noremap = true, silent = true }
    vim.keymap.set('n', '<CR>', jump_to_mark, map_opts)
    vim.keymap.set('n', 'q', ':close<CR>', map_opts)
    vim.keymap.set('n', '<Esc>', ':close<CR>', map_opts)
end

vim.keymap.set("n", "<C-m>m", marks_float_menu)


