require("catppuccin").setup({
    integrations = {
        cmp = true,          -- One line turns on all those colors
        treesitter = true,
        mason = true,
    }
})
vim.cmd.colorscheme "catppuccin"
