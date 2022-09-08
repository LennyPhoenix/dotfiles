local status_ok, indentline = pcall(require, "indent_blankline")
if not status_ok then
    vim.notify("indent_blankline not found")
    return
end

indentline.setup {
    show_current_context = true,
    use_treesitter = true,
    filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "startify",
        "",
    },
}
