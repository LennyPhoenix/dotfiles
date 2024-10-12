local function config()
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(lang, bufnr)
				-- Disable for files with more than 4k columns

				-- Get all lines in the buffer
				local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

				-- Iterate through each line and get the column count
				for _, line in ipairs(lines) do
					local col_count = vim.fn.strdisplaywidth(line)
					if col_count > vim.bo[bufnr].synmaxcol then
						return true
					end
				end

				return false
			end,
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
