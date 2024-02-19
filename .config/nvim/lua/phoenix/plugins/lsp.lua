local function setup()
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

local function set_keybinds(bufnr)
    require("which-key").register({
        ["<Leader>"] = {
            l = {
                name = "Lsp",
                r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
                a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
                l = { "<Cmd>lua vim.diagnostic.open_float()<CR>", "Line Info" },
                d = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics" },
                f = { "<Cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
                s = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
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
    }, { buffer = bufnr })
end

local function setup_rust()
    vim.g.rustaceanvim = {
        server = {
            on_attach = function(_, bufnr)
                set_keybinds(bufnr)
                require("which-key").register({
                    ["<Leader>l"] = {
                        a = { "<Cmd>RustLsp codeAction<CR>", "Code Actions" },
                        c = { "<Cmd>RustLsp openCargo<CR>", "Open Cargo.toml" },
                        p = { "<Cmd>RustLsp parentModule<CR>", "Parent Module" },
                        R = { "<Cmd>RustLsp runnables", "Runnables" },
                        D = { "<Cmd>RustLsp debuggables", "Debuggables" },
                        j = { "<Cmd>RustLsp joinLines<CR>", "Join Lines" },
                        l = { "<Cmd>RustLsp renderDiagnostic<CR>", "Line Info" },
                    },
                    ["<A-k>"] = { "<Cmd>RustLsp moveItem up<CR>", "Move item up" },
                    ["<A-j>"] = { "<Cmd>RustLsp moveItem down<CR>", "Move item down" },
                    K = { "<Cmd>RustLsp hover actions<CR>", "Documentation" },
                }, { buffer = bufnr })
            end,
        },
    }
end

local function config()
    require("mason-lspconfig").setup()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local opts = {
        on_attach = function(_, bufnr)
            set_keybinds(bufnr)
        end,
        capabilities = capabilities
    }

    require("mason-lspconfig").setup_handlers {
        function(server_name)
            require("lspconfig")[server_name].setup(opts)
        end,
        ["lua_ls"] = function()
            require("neodev").setup {
                library = { plugins = { "nvim-dap-ui" }, types = true },
            }
            require("lspconfig").lua_ls.setup(opts)
        end,
        ["rust_analyzer"] = setup_rust,
    }

    require("mason-null-ls").setup({
        automatic_installation = false,
        handlers = {}
    })
    require("null-ls").setup {
        on_attach = function(_, bufnr)
            set_keybinds(bufnr)
        end,
        capabilities = capabilities
    }

    setup()
end

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "mason.nvim",
        "which-key.nvim",
        "telescope.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",
        "mrcjkb/rustaceanvim",
        "jay-babu/mason-null-ls.nvim",
        "jose-elias-alvarez/null-ls.nvim"
    },
    config = config
}
