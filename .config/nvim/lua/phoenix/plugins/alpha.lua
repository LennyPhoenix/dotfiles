local function keybinds()
    require("which-key").register {
        ["<Leader>h"] = { "<Cmd>Alpha<CR>", "Home" }
    }
end

local function config()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
        [[        _                      _                   _            ]],
        [[  _ __ | |__   ___   ___ _ __ (_)_  __  _ ____   _(_)_ __ ___   ]],
        [[ | '_ \| '_ \ / _ \ / _ \ '_ \| \ \/ / | '_ \ \ / / | '_ ` _ \  ]],
        [[ | |_) | | | | (_) |  __/ | | | |>  < _| | | \ V /| | | | | | | ]],
        [[ | .__/|_| |_|\___/ \___|_| |_|_/_/\_(_)_| |_|\_/ |_|_| |_| |_| ]],
        [[ |_|                                                            ]],
    }
    dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<Cmd>ene<CR>"),
        dashboard.button("p", "  Find project", "<Cmd>Telescope projects<CR>"),
        dashboard.button("f", "󰈞  Find file", "<Cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recently used files", "<Cmd>Telescope oldfiles<CR>"),
        dashboard.button("t", "  Find text", "<Cmd>Telescope live_grep<CR>"),
        dashboard.button("v", "  Configuration", "<Cmd>e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "󰗼  Quit", "<Cmd>qa<CR>"),
    }

    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    require("alpha").setup(dashboard.opts)

    keybinds()
end

return {
    "goolord/alpha-nvim",
    dependencies = { "which-key.nvim", "BlakeJC94/alpha-nvim-fortune" },
    config = config,
}
