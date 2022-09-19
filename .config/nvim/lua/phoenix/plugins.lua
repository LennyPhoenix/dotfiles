local fn = vim.fn

-- Install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone",
        "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    vim.notify("Installing packer, close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Refresh packer on save
local group = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "plugins.lua",
        command = "source <afile> | PackerSync",
        group = group
    }
)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Misc
    use("lewis6991/impatient.nvim")
    use("folke/which-key.nvim")
    use("ahmedkhalf/project.nvim")
    use("ggandor/lightspeed.nvim")
    use("andweeb/presence.nvim")
    use("luukvbaal/nnn.nvim")
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use {
        "kdheepak/tabline.nvim",
        requires = {
            { "hoob3rt/lualine.nvim", opt = true },
            { "kyazdani42/nvim-web-devicons", opt = true },
        }
    }
    use("moll/vim-bbye")
    use("nvim-treesitter/nvim-treesitter")
    use("lukas-reineke/indent-blankline.nvim")
    use("wakatime/vim-wakatime")
    use("akinsho/toggleterm.nvim")
    use("windwp/nvim-autopairs")

    -- Git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- Completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("jose-elias-alvarez/null-ls.nvim")
    use("RRethy/vim-illuminate")

    -- Start Screen
    use {
        "goolord/alpha-nvim",
        requires = { "BlakeJC94/alpha-nvim-fortune" },
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- Themes
    use("Shatur/neovim-ayu")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
