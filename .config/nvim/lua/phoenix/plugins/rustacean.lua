-- In your neovim config (e.g., init.lua or after/plugin/telescope.lua)
vim.api.nvim_create_user_command("TelescopeDiagnosticsCurrentPackage", function()
	local current_file = vim.fn.expand("%:p")

	-- Find the nearest Cargo.toml for the current file
	local function find_package_root(path)
		local dir = vim.fn.fnamemodify(path, ":h")
		while dir ~= "/" do
			if vim.fn.filereadable(dir .. "/Cargo.toml") == 1 then
				return dir
			end
			dir = vim.fn.fnamemodify(dir, ":h")
		end
		return nil
	end

	local package_root = find_package_root(current_file)

	if package_root then
		require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy({
			root_dir = package_root,
		}))
	else
		require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy())
	end
end, {})

return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
}
