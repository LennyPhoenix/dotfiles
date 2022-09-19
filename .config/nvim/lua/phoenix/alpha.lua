local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    vim.notify("alpha not found")
    return
end

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
    dashboard.button("f", "  Find file", "<Cmd>Telescope find_files<CR>"),
    dashboard.button("r", "  Recently used files", "<Cmd>Telescope oldfiles<CR>"),
    dashboard.button("t", "  Find text", "<Cmd>Telescope live_grep<CR>"),
    dashboard.button("v", "  Configuration", "<Cmd>e ~/.config/nvim/init.lua<CR>"),
    dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
}

local fortune_status_ok, fortune = pcall(require, "alpha.fortune")
local footer = ""
if fortune_status_ok then
    footer = fortune()
else
    vim.notify("alpha.fortune not found")
    footer = "by LennyPhoenix"
end
dashboard.section.footer.val = footer

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
