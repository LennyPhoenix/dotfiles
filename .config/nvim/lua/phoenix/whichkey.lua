local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    vim.notify("which-key not found")
    return
end

local setup = {
    plugins = {
        marks = true,
        registers = true,
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    key_labels = {
        ["<Space>"] = "SPC",
        ["<Leader>"] = "LEADER",
        ["<CR>"] = "RET",
        ["<Tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    popup_mappings = {
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
    },
    window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 16,
        align = "center",
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<Leader>"} -- or specify a list manually
    triggers_blacklist = {},
}

local opts = {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    ["c"] = { "<Cmd>Bdelete<CR>", "Close Buffer" },
    ["v"] = { "<Cmd>e ~/.config/nvim/init.lua<CR>", "Config" },
    ["e"] = { "<Cmd>NnnExplorer<CR>", "Explorer" },
    ["n"] = { "<Cmd>NnnPicker<CR>", "NNN" },
    ["h"] = { "<Cmd>Alpha<CR>", "Home" },
    ["g"] = { "<Cmd>Git<CR>", "Git" },
    ["w"] = { "<Cmd>w<CR>", "Write" },

    f = {
        name = "Find",
        f = { "<Cmd>Telescope find_files theme=dropdown<CR>", "File" },
        F = { "<Cmd>Telescope git_files theme=dropdown<CR>", "Git File" },
        b = { "<Cmd>Telescope buffers theme=dropdown<CR>", "Buffer" },
        g = { "<Cmd>Telescope live_grep<CR>", "Grep" },
        p = { "<Cmd>Telescope projects<CR>", "Project" },
        B = { "<Cmd>Telescope git_branches<CR>", "Branch" },
    },

    l = {
        name = "LSP",
        i = { "<Cmd>LspInfo<CR>", "Info" },
        I = { "<Cmd>LspInstallInfo<CR>", "Installer" },
    },

    p = {
        name = "Plugins",
        c = { "<Cmd>PackerCompile<CR>", "Compile" },
        i = { "<Cmd>PackerInstall<CR>", "Install" },
        s = { "<Cmd>PackerSync<CR>", "Sync" },
        S = { "<Cmd>PackerStatus<CR>", "Status" },
        u = { "<Cmd>PackerUpdate<CR>", "Update" },
    },

    t = {
        name = "Terminal",
        h = { "<Cmd>lua _HTOP_TOGGLE()<CR>", "Htop" },
        g = { "<Cmd>lua _LAZYGIT_TOGGLE()<CR>", "Git" },
        t = { "<Cmd>ToggleTerm direction=horizontal<CR>", "Bottom" },
        T = { "<Cmd>ToggleTerm direction=vertical size=80<CR>", "Right" },
    }
}

which_key.setup(setup)
which_key.register(mappings, opts)
