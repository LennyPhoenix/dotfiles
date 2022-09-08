local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    vim.notify("null-ls not found")
    return
end

-- For implemented sources head to the following link:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins

local formatting = null_ls.builtins.formatting

null_ls.setup {
    debug = false,
    sources = {
        formatting.black,
    },
    on_attach = require("phoenix.lsp.handlers").on_attach,
}
