vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    --                              Packer
    use 'wbthomason/packer.nvim'
    --                              TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    --                              Harpoon
    use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("harpoon"):setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
                key = function()
                    return vim.loop.cwd()
                end
            }
        })
        -- Load your keymaps after setup is called
        require("config.harpoon") 
      end    }
    --                             Oil 
    use{
      "stevearc/oil.nvim",
      config = function()
        require("oil").setup({
            columns = {
                { "permissions", highlight = "Comment" },
                { "size", highlight = "Special" },
                { "mtime", highlight = "Number" },
            },
            -- Replaces netrw (standard explorer) completely
            default_file_explorer = true,
            -- Send deleted files to trash instead of permanent deletion
            delete_to_trash = true,
            -- Skips the confirmation popup for simple things like renames
            -- skip_confirm_for_simple_edits = true,
            view_options = {
                -- Show files/folders that start with a dot
                show_hidden = true,
                -- Sort folders before files
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },

            -- Floating window configuration
            float = {
                padding = 2,
                max_width = 80,
                max_height = 20,
                border = "rounded", -- Options: "single", "double", "shadow", "curved"
                win_options = {
                    winblend = 0,
                },
            },

            -- Custom keymaps *inside* the Oil buffer
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-d>"] = "actions.select_split",
                ["<C-a>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["<C-t>"] = {
                    desc = "Open terminal in selected directory",
                    callback = function()
                        local oil = require("oil")
                        local entry = oil.get_cursor_entry()
                        local dir = oil.get_current_dir()

                        if not entry or not dir then
                            return
                        end

                        local target = dir
                        if entry.type == "directory" then
                            target = dir .. entry.name
                        end

                        -- Use vim.schedule to wait until the UI is ready
                        vim.schedule(function()
                            -- Create a horizontal split
                            vim.cmd("split")
                            
                            -- Explicitly start a terminal in the target directory
                            -- This uses the 'lcd' (local cd) command to set the path specifically for this window
                            vim.cmd("lcd " .. vim.fn.fnameescape(target))
                            vim.cmd("terminal")
                            
                            -- Enter Insert mode automatically so you can start typing
                            vim.cmd("startinsert")
                        end)
                    end,
                },
            },
        })
    end,
    }
    --                             Telescope 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { 
            {'nvim-lua/plenary.nvim'},
            -- Highly recommended: FZF native for much faster sorting
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
        config = function()
        require('telescope').setup({
            defaults = {
            -- Your defaults here
            }
        })
        -- Load the fzf extension
        require('telescope').load_extension('fzf')
      end
    }
    --                             Completion Engine & Sources
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',       -- Buffer source (suggests words in file)
            'hrsh7th/cmp-path',         -- Path source (suggests file paths)
            'L3MON4D3/LuaSnip',         -- Snippet engine (required for cmp)
            'saadparwaiz1/cmp_luasnip', -- Snippet source
        }
    }
    -- LSP Management
    use {
        'neovim/nvim-lspconfig',        -- Easy configs for LSP servers
        'williamboman/mason.nvim',      -- Portable package manager for LSPs
        'williamboman/mason-lspconfig.nvim', -- Bridges mason and lspconfig
    }
    --                             Colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }
    --                             Tail
    -- use { "thgrass/tail.nvim" }
    --                             Csv
    -- use { 'chrisbra/csv.vim' }
    --                             diffview 
    use {
        "sindrets/diffview.nvim",
    }
end)


local ts_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if ts_ok then
    ts_configs.setup {
        ensure_installed = {
            "c", "cpp", "fortran", "pascal",
            "lua", "python", "julia",
            "bash", "powershell",
            "json", "csv", "markdown", "xml", "html"
        },
        highlight = { enable = true },
    }
end

