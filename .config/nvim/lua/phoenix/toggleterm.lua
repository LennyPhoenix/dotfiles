local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    vim.notify("toggleterm not found")
    return
end

toggleterm.setup {
    size = 20,
    open_mapping = "<C-\\>",
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    winbar = {
        enabled = true,
    },
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<C-space>", "<C-\\><C-n>", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-w>", "<C-\\><C-n><C-w>", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-q>", "<C-\\><C-n><C-w>q", opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local htop = Terminal:new { cmd = "htop", hidden = true }

function _HTOP_TOGGLE()
    htop:toggle()
end
