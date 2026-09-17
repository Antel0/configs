local harpoon = require("harpoon")
local harpoon_leader = "<C-h>"

local function map(key, func, desc)
    vim.keymap.set("n", harpoon_leader .. key, func, { desc = desc })
end

-- Use the Harpoon2 List API
map("a", function() harpoon:list():add() end, "Add File")
map("e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle Menu")

-- Navigation
map("1", function() harpoon:list():select(1) end, "Go to File 1")
map("2", function() harpoon:list():select(2) end, "Go to File 2")
map("3", function() harpoon:list():select(3) end, "Go to File 3")
map("4", function() harpoon:list():select(4) end, "Go to File 4")
