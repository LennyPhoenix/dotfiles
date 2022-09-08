local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("nvim-treesitter not found")
    return
end

configs.setup {
    ensure_installed = "all",
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = {},
    },
    autopairs = {
        enable = true,
    },
}
