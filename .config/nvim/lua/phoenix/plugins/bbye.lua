return {
    "moll/vim-bbye",
    dependencies = { "which-key.nvim" },
    config = function()
        require("which-key").register {
            ["<Leader>"] = {
                c = { "<Cmd>Bdelete<CR>", "Close Buffer" },
                C = { "<Cmd>Bdelete!<CR>", "KILL Buffer" },
            }
        }
    end
}
