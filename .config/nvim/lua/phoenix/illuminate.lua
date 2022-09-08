local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
    vim.notify("illuminate not found")
    return
end

vim.cmd([[
    hi def IlluminatedWordText gui=underline
    hi def IlluminatedWordRead gui=underline
    hi def IlluminatedWordWrite gui=underline
]])

illuminate.configure {
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    delay = 0,
    under_cursor = true,
}
