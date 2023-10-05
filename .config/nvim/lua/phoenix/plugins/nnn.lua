local function keybinds()
    require("which-key").register {
        ["<Leader>"] = {
            e = { "<Cmd>NnnExplorer<CR>", "Explorer" },
            n = { "<Cmd>NnnPicker<CR>", "NNN" },
        }
    }
end

local function config()
    require("nnn").setup {
        explorer = {
            cmd = "nnn",
            width = 28,
            side = "topleft",
            session = "global", -- or "global" / "local" / "shared"
            tabs = true,
        },
        picker = {
            cmd = "nnn",
            style = {
                width = 0.6,
                height = 0.8,
                xoffset = 0.5,
                yoffset = 0.5,
                border = "rounded"
            },
            session = "", -- or "global" / "local" / "shared"
        },
        auto_open = {
            setup = nil,   -- or "explorer" / "picker", auto open on setup function
            tabpage = nil, -- or "explorer" / "picker", auto open when opening new tabpage
            empty = true,  -- only auto open on empty buffer
            ft_ignore = {  -- dont auto open for these filetypes
                "gitcommit",
            }
        },
        auto_close = true,        -- close tabpage/nvim when nnn is last window
        replace_netrw = "picker", -- or "explorer" / "picker"
        mappings = {},            -- table containing mappings, see below
        windownav = {             -- window movement mappings to navigate out of nnn
            left = "<C-w>h",
            right = "<C-w>l",
            next = "<C-w>w",
            prev = "<C-w>W",
        },
        buflisted = false, -- whether or not nnn buffers show up in the bufferlist
        quitcd = "tcd",    -- or "cd" / "lcd", command to run if quitcd file is found
        offset = false,    -- whether or not to write position offset to tmpfile(for use in preview-tui)
    }

    keybinds()
end

return {
    "luukvbaal/nnn.nvim",
    dependencies = { "which-key.nvim" },
    config = config
}
