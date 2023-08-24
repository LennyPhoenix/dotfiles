local function keybinds()
    require("which-key").register {
        ["<Leader>g"] = {
            name = "Git",
            g = { "<Cmd>Git<CR>", "Open" },
            h = {
                name = "Hunk",
                p = { "<Cmd>Gitsigns preview_hunk<CR>", "Preview" },
                s = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage" },
                u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Unstage" },
                R = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset" },
            },
            w = { "<Cmd>Gitsigns toggle_word_diff<CR>", "Toggle Word Diff" },
        },

        ["]"] = {
            h = { "<Cmd>Gitsigns next_hunk<CR>", "Git Hunk" },
        },

        ["["] = {
            h = { "<Cmd>Gitsigns prev_hunk<CR>", "Git Hunk" },
        },
    }
end

local function config()
    require("gitsigns").setup {
        signs = {
            add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            topdelete = { hl = "GitSignsDelete", text = "¯", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            changedelete = {
                hl = "GitSignsChange",
                text = "~",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn"
            },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter_opts = {
            relative_time = true,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
        yadm = {
            enable = true,
        },
    }

    -- No git gutter!!! >:(
    vim.g.yadm_git_gitgutter_enabled = 0

    keybinds()
end


return {
    "tpope/vim-fugitive",
    dependencies = {
        "which-key.nvim",
        "lewis6991/gitsigns.nvim",
        "seanbreckenridge/yadm-git.vim",
    },
    config = config
}
