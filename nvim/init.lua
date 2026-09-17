------------------------------------------------------- Nvim Native -------------------------------------------------------
--   General Settings
vim.opt.tags = "./tags;,tags;"
vim.opt.number = true                   -- show line numbers
vim.opt.relativenumber = true           -- relative numbers
vim.opt.wrap = false                    -- no line wrapping
vim.opt.tabstop = 4                     -- tab width
vim.opt.shiftwidth = 4
vim.opt.expandtab = true                -- use spaces instead of tabs
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"       -- use system clipboard
vim.opt.cursorline = true               -- highlight current line
vim.opt.showmatch = true                -- highlight matching parentheses
vim.opt.cinoptions:append("#1")         -- Allows to indent C preprocessor directives starting with #
vim.cmd("syntax on")                    -- Enable syntax highlighting 
vim.cmd("filetype plugin indent on")



--                       WINDOWS
require("config.windows")
--                       BUFFERS
require("config.buffers")
--                       TERMINAL 
require("config.terminal")
--                       MARKS 
require("config.marks")                      
--                       TABS 
require("config.tabs")
--                       FOLDS
require("config.folds")
--                       CTAGS 
require("config.ctags")
--                       MY COMMANDS 
require("src.my_cmds")
--                       MY AUTOCOMMANDS 
require("src.my_autocmds")
------------------------------------------------------- Nvim Plugins -------------------------------------------------------
require("plugins")
--                              COLORSCHEME
require("config.colorscheme")
--                              OIL
require("config.oil")
--                              TELESCOPE
require("config.telescope")
--                              HARPOON
require("config.harpoon")
--                              LSP's and Completion
require("config.lsp")
--                              CSV
require("config.csv")

