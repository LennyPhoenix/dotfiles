local function config()
	require("project_nvim").setup({
		active = true,
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "lsp", "pattern" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
		show_hidden = true,
		silent_chdir = true,
		ignore_lsp = {},
		datapath = vim.fn.stdpath("data"),
	})

	require("telescope").load_extension("projects")
end

return {
	"ahmedkhalf/project.nvim",
	dependencies = { "telescope.nvim" },
	config = config,
}
