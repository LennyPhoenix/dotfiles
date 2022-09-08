local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig not found")
    return
end

require("phoenix.lsp.configs")
require("phoenix.lsp.handlers").setup()
require("phoenix.lsp.null-ls")
