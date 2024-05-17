return {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = false,
    init = function()
        local colors = require("ayu.colors")
        colors.generate(false)

        require("ayu").setup({
            overrides = {
                LspInlayHint = { fg = colors.comment }
            }
        })
        require("ayu").colorscheme()
    end
}
