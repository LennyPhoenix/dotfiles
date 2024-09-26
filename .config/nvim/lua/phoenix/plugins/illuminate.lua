local function config()
	vim.cmd([[
        hi def IlluminatedWordText gui=underline
        hi def IlluminatedWordRead gui=underline
        hi def IlluminatedWordWrite gui=underline
    ]])

	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 0,
		under_cursor = true,
	})
end

return {
	"RRethy/vim-illuminate",
	config = config,
}
