local group = vim.api.nvim_create_augroup("OptionsUserConfig", { clear = true })
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "options.lua",
        command = "source <afile>",
        group = group
    }
)

local options = {
    -- Interface
    cmdheight = 1,
    pumheight = 10,  -- pop up menu height
    showtabline = 2, -- always show tabs
    termguicolors = true,
    timeoutlen = 300,
    number = true,
    signcolumn = "yes",
    wrap = false,
    cursorline = true,
    hidden = true,

    -- Navigation
    mouse = "a",
    scrolloff = 8,
    sidescrolloff = 8,
    splitbelow = true,
    splitright = true,

    -- Text
    smartindent = true,
    fileencoding = "utf-8",
    swapfile = false, -- this is just annoying
    undofile = true,  -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4,   -- the number of spaces inserted for each indentation
    tabstop = 4,      -- insert 4 spaces for a tab

    -- Search
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,
}

-- Flags
vim.opt.whichwrap:append("h,l")
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
    vim.opt[k] = v
end
