-- Activates Text Wrap Automaticly for .txt and .md files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {'*.txt', '*.md'},
    command ="set wrap",
})
