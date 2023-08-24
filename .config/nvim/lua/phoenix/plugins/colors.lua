return {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = false,
    init = function()
        require("ayu").colorscheme()
    end
}
