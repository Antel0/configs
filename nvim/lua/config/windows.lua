-- local float = require("float")

local window_lead = "<C-w>"
vim.keymap.set("n", window_lead .. "a", ":vnew<CR>", {noremap = true, silent = false })      -- Open Vertical Window
vim.keymap.set("n", window_lead .. "s", ":vsplit<CR>", { noremap = true, silent = false })   -- Splits Window Vertically
vim.keymap.set("n", window_lead .. "d", ":new<CR>", { noremap = true, silent = false })      -- Open Horizontal Window
vim.keymap.set("n", window_lead .. "f", ":split<CR>", { noremap = true, silent = false })    -- Splits Window Horizontally
--   Window Resizing
local function smart_resize(direction)
    local amt = 5
    if direction == "right" then
        -- If I can move right, I'm not the rightmost. Increase width.
        -- Otherwise, I am the rightmost, so decrease width to "pull" the border.
        if vim.fn.winnr('l') ~= vim.fn.winnr() then
            vim.cmd("vertical resize +" .. amt)
        else
            vim.cmd("vertical resize -" .. amt)
        end
    elseif direction == "left" then
        -- If I can move right, decrease. If I am rightmost, increase.
        if vim.fn.winnr('l') ~= vim.fn.winnr() then
            vim.cmd("vertical resize -" .. amt)
        else
            vim.cmd("vertical resize +" .. amt)
        end
    elseif direction == "up" then
        -- If there is a window below me, -5 shrinks from bottom. 
        -- If I'm the bottom window, -5 pulls the top border down.
        if vim.fn.winnr('j') ~= vim.fn.winnr() then
            vim.cmd("resize -" .. amt)
        else
            vim.cmd("resize +" .. amt)
        end
    elseif direction == "down" then
        if vim.fn.winnr('j') ~= vim.fn.winnr() then
            vim.cmd("resize +" .. amt)
        else
            vim.cmd("resize -" .. amt)
        end
    end
end
vim.keymap.set("n", window_lead .. "<right>", function() smart_resize("right") end, { silent = true })
vim.keymap.set("n", window_lead .. "<left>",  function() smart_resize("left") end,  { silent = true })
vim.keymap.set("n", window_lead .. "<up>",    function() smart_resize("up") end,    { silent = true })
vim.keymap.set("n", window_lead .. "<down>",  function() smart_resize("down") end,  { silent = true })
--   Terminal Mode Key Maps - Window navigation  
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
--  Motions in Insert Mode ??  TODO: Investigate that, it's not really working
vim.keymap.set("i", "<C-q>", "<C-w>q", { noremap = true, silent = false })        -- Close the window
vim.keymap.set("i", "<C-j>", "<C-w>j", { noremap = true, silent = false })        -- Go to the window down
vim.keymap.set("i", "<C-k>", "<C-w>k", { noremap = true, silent = false })        -- Go to the window above
vim.keymap.set("i", "<C-l>", "<C-w>l", { noremap = true, silent = false })        -- Go to the window right

-- Float Window User Commands
vim.api.nvim_create_user_command(       -- Opens a Floating Window
    "FloatW", 
    function(opts)
        local cmd = opts.args ~= "" and opts.args or "Ex"
        float.float_window(cmd, 90, 30)
    end,
    {
        nargs = "?",
        complete = function()
            return {"Ex", "term", "ls"}  -- optional completions
        end
    }
)
vim.api.nvim_create_user_command(       -- Opens a Floating Window with the this file  
    "FloatC", 
    function()
        local init_path = vim.fn.stdpath("config") .. "/init.lua"
        float.float_window("edit " .. init_path, 90, 30)
    end,
    {}
)
vim.api.nvim_create_user_command(       -- Opens a floating window with a terminal 
    "FloatT", 
    function()
        float.float_window("term", 90, 30)
    end,
    {}
)
