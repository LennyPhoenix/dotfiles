local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 80,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        width = 80,
    })
end

local function lsp_keymaps(bufnr)
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
        vim.notify("which-key not found, unable to register for lsp")
        return
    end

    local opts = {
        mode = "n",
        buffer = bufnr,
        silent = true,
        noremap = true,
        nowait = true,
    }

    local mappings = {
        ["<Leader>"] = {
            l = {
                r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
                a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
                l = { "<Cmd>lua vim.diagnostic.open_float()<CR>", "Line Info" },
                d = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics" },
                f = { "<Cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
            },

            f = {
                r = { "<Cmd>Telescope lsp_references theme=ivy<CR>", "References" },
                d = { "<Cmd>Telescope diagnostics theme=ivy<CR>", "Diagnostics" },
            },
        },

        g = {
            d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
            D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
            r = { "<Cmd>lua vim.lsp.buf.references()<CR>", "References" },
            i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
        },

        ["]d"] = { "<Cmd>lua vim.diagnostic.goto_next { border = 'rounded' }<CR>", "Diagnostic" },
        ["[d"] = { "<Cmd>lua vim.diagnostic.goto_prev { border = 'rounded' }<CR>", "Diagnostic" },

        K = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Documentation" },
        ["<C-k>"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
    }

    which_key.register(mappings, opts)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function lsp_autoformat(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.format { async = false } end,
        })
    end
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_autoformat(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    vim.notify "cmp_nvim_lsp not found"
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
