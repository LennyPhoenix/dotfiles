--        _                      _                   _
--  _ __ | |__   ___   ___ _ __ (_)_  __  _ ____   _(_)_ __ ___
-- | '_ \| '_ \ / _ \ / _ \ '_ \| \ \/ / | '_ \ \ / / | '_ ` _ \
-- | |_) | | | | (_) |  __/ | | | |>  < _| | | \ V /| | | | | | |
-- | .__/|_| |_|\___/ \___|_| |_|_/_/\_(_)_| |_|\_/ |_|_| |_| |_|
-- |_|                                            By LennyPhoenix

-- Vanilla Settings
require("phoenix.options")
require("phoenix.keymaps")

-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Load Plugins
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("phoenix.plugins", {
	change_detection = {
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
