-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Option Presets
local noremap = { noremap = true, silent = true }
local default = { silent = true }

-- Use space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Move text up and down
keymap("n", "<A-k>", "<Cmd>m .-2<CR>==", noremap)
keymap("n", "<A-j>", "<Cmd>m .+1<CR>==", noremap)

-- Navigate windows
keymap("n", "<C-h>", "<C-w>h", noremap)
keymap("n", "<C-j>", "<C-w>j", noremap)
keymap("n", "<C-k>", "<C-w>k", noremap)
keymap("n", "<C-l>", "<C-w>l", noremap)
keymap("n", "<C-q>", "<C-w>q", noremap)

-- Navigate buffers
keymap("n", "<S-l>", "<Cmd>bnext<CR>", noremap)
keymap("n", "<S-h>", "<Cmd>bprevious<CR>", noremap)

-- Navigate tabs
keymap("n", "<A-l>", "<Cmd>tabn<CR>", noremap)
keymap("n", "<A-h>", "<Cmd>tabp<CR>", noremap)

-- Visual --
-- Move text up and down
keymap("v", "<M-k>", "<Cmd>m .-2<CR>==", noremap)
keymap("v", "<M-j>", "<Cmd>m .+1<CR>==", noremap)
-- Paste without writing to register
keymap("v", "p", "\"_dP", noremap)
keymap("v", "\"p", "\"_d\"+P", noremap)

-- Visual Block --
-- Move text up and down
keymap("x", "<M-j>", "<Cmd>move '>+1<CR>gv-gv", noremap)
keymap("x", "<M-k>", "<Cmd>move '<-2<CR>gv-gv", noremap)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", default)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", default)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", default)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", default)
