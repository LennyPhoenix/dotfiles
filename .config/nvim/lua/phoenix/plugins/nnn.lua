local function keybinds()
	require("which-key").register({
		["<Leader>"] = {
			e = { "<Cmd>NnnExplorer %:p<CR>", "Explorer" },
			n = { "<Cmd>NnnPicker %:p<CR>", "NNN" },
		},
	})
end

local function config()
	require("nnn").setup({
		explorer = {
			cmd = "nnn", -- command override (-F1 flag is implied, -a flag is invalid!)
			width = 32, -- width of the vertical split
			side = "topleft", -- or "botright", location of the explorer window
			session = "local", -- or "global" / "local" / "shared"
			tabs = false, -- separate nnn instance per tab
			fullscreen = true, -- whether to fullscreen explorer window when current tab is empty
		},
		picker = {
			cmd = "nnn", -- command override (-p flag is implied)
			style = {
				width = 0.5, -- percentage relative to terminal size when < 1, absolute otherwise
				height = 0.5, -- ^
				xoffset = 0.5, -- ^
				yoffset = 0.5, -- ^
				border = "rounded", -- border decoration for example "rounded"(:h nvim_open_win)
			},
			session = "local", -- or "global" / "local" / "shared"
			tabs = true, -- separate nnn instance per tab
			fullscreen = true, -- whether to fullscreen picker window when current tab is empty
		},
		auto_open = {
			setup = nil, -- or "explorer" / "picker", auto open on setup function
			tabpage = nil, -- or "explorer" / "picker", auto open when opening new tabpage
			empty = false, -- only auto open on empty buffer
			ft_ignore = { -- dont auto open for these filetypes
				"gitcommit",
			},
		},
		auto_close = true, -- close tabpage/nvim when nnn is last window
		replace_netrw = "picker", -- or "explorer" / "picker"
		mappings = {}, -- table containing mappings, see below
		windownav = { -- window movement mappings to navigate out of nnn
			left = "<C-w>h",
			right = "<C-w>l",
			next = "<C-w>w",
			prev = "<C-w>W",
		},
		buflisted = false, -- whether or not nnn buffers show up in the bufferlist
		quitcd = nil, -- or "cd" / tcd" / "lcd", command to run on quitcd file if found
		offset = false, -- whether or not to write position offset to tmpfile(for use in preview-tui)
	})

	keybinds()
end

return {
	"luukvbaal/nnn.nvim",
	dependencies = { "which-key.nvim" },
	config = config,
}
