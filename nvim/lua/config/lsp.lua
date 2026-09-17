local lsp_leader = "<F2>"
-- Global LSP mappings
vim.keymap.set('n', lsp_leader .. 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', lsp_leader .. 'gr', vim.lsp.buf.references, { desc = "Find References/Usages" })
vim.keymap.set('n', lsp_leader .. 'K',  vim.lsp.buf.hover,      { desc = "Show Documentation/Type" })
vim.keymap.set('n', lsp_leader .. 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set('n', lsp_leader .. 'ds', vim.lsp.buf.document_symbol, { desc = "Search Symbols in File" })
vim.keymap.set('n', lsp_leader .. 'ws', vim.lsp.buf.workspace_symbol, { desc = "Search Symbols in Project" })

-- Clangd specific: Switch between .c and .h
vim.keymap.set('n', lsp_leader .. 'h', ':ClangdSwitchSourceHeader<CR>', { desc = "Switch Source/Header" })

local lspconfig = require('lspconfig')
require("mason").setup()
require("mason-lspconfig").setup({
    -- Add the servers for the languages you use
    ensure_installed = { "lua_ls", "pyright", "clangd" } 
})

-- Tell your LSP to communicate with your completion engine
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Set up Lua
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    -- your other settings...
})
-- Set up Python
vim.lsp.config('pyright', {
    capabilities = capabilities,
})

-- Set up Golan
vim.lsp.config('gopls', {
    capabilities = capabilities,
})
-- Set up Clangd (C/C++)
vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
    },
})
vim.lsp.enable('clangd')
-- Repeat for other servers (pyright, clangd, etc.)
local cmp = require'cmp'
-- Custom Colors for the Completion Menu
cmp.setup({
    window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:CmpNormal,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:CmpDoc",
        }),
      },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- This labels where the completion came from
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip  = "[Snippet]",
        buffer   = "[Buffer]",
        path     = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),            -- Manually Trigger the Completion Tab 
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept completion with Enter
    ['<Tab>'] = cmp.mapping(function(fallback)         -- Use Tab to cycle
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

