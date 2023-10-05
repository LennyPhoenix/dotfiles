---@diagnostic disable: missing-fields
local function has_words_before()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function config()
    local cmp = require("cmp")
    local snippy = require("snippy")
    require("copilot_cmp").setup()
    cmp.setup {
        snippet = {
            expand = function(args)
                snippy.expand_snippet(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
            ["<C-Space>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.abort()
                else
                    cmp.complete()
                end
            end, { "i", "c" }),
            ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
            ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            ["<C-h>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-l>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif snippy.can_expand_or_advance() then
                    snippy.expand_or_advance()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif snippy.can_jump(-1) then
                    snippy.previous()
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "snippy" },
            { name = "path" },
            { name = "buffer" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        experimental = {
            ghost_text = true,
        },
    }

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end


return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "dcampos/cmp-snippy",
        "zbirenbaum/copilot-cmp",
        "nvim-snippy"
    },
    config = config
}
