local function config()
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		highlight = {
			enable = true,
			disable = {},
		},
		autopairs = {
			enable = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = config,
}
