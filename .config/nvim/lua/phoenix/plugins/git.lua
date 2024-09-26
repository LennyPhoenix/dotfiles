local function keybinds()
	require("which-key").register({
		["<Leader>g"] = {
			name = "Git",
			g = { "<Cmd>Git<CR>", "Open" },
			h = {
				name = "Hunk",
				p = { "<Cmd>Gitsigns preview_hunk<CR>", "Preview" },
				s = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage" },
				u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Unstage" },
				R = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset" },
			},
			w = { "<Cmd>Gitsigns toggle_word_diff<CR>", "Toggle Word Diff" },
		},

		["]"] = {
			h = { "<Cmd>Gitsigns next_hunk<CR>", "Git Hunk" },
		},

		["["] = {
			h = { "<Cmd>Gitsigns prev_hunk<CR>", "Git Hunk" },
		},
	})
end

local function config()
	local all = {
		"GitSignsAdd",
		"GitSignsAddLn",
		"GitSignsAddNr",
		"GitSignsChange",
		"GitSignsChangeLn",
		"GitSignsChangeNr",
		"GitSignsChangedelete",
		"GitSignsChangedeleteLn",
		"GitSignsChangedeleteNr",
		"GitSignsDelete",
		"GitSignsDeleteLn",
		"GitSignsDeleteNr",
		"GitSignsTopdelete",
		"GitSignsTopdeleteLn",
		"GitSignsTopdeleteNr",
	}

	for _, key in pairs(all) do
		vim.api.nvim_set_hl(0, key, { link = key })
	end

	require("gitsigns").setup({
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "_" },
			topdelete = { text = "¯" },
			changedelete = { text = "~" },
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		yadm = {
			enable = true,
		},
	})

	keybinds()
end

return {
	"tpope/vim-fugitive",
	dependencies = {
		"which-key.nvim",
		"lewis6991/gitsigns.nvim",
		"seanbreckenridge/yadm-git.vim",
	},
	config = config,
}
