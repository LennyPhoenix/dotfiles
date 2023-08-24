local function config()
    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "ayu",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }

    require("tabline").setup {
        enable = true,
        options = {
            max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
            show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
            show_devicons = true,    -- this shows devicons in buffer section
            show_bufnr = false,      -- this appends [bufnr] to buffer section,
            show_filename_only = true, -- shows base filename only instead of relative path in filename
            modified_icon = "+ ",    -- change the default modified icon
            modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
            show_tabs_only = false,  -- this shows only tabs instead of tabs + buffers
        }
    }

    vim.cmd([[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]])
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "kdheepak/tabline.nvim" },
    config = config
}
