local function config()
	require("which-key").setup({
		plugins = {
			marks = true,
			registers = true,
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		key_labels = {
			["<Space>"] = "SPC",
			["<Leader>"] = "LEADER",
			["<CR>"] = "RET",
			["<Tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		popup_mappings = {
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
		window = {
			border = "rounded",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 2, 2, 2, 2 },
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 16,
			align = "center",
		},
		ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true,
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<Leader>"} -- or specify a list manually
		triggers_blacklist = {},
	})

	require("which-key").register({
		["<Leader>"] = {
			v = { "<Cmd>e ~/.config/nvim/init.lua<CR>", "Config" },
			w = { "<Cmd>w<CR>", "Write" },
			T = { "<Cmd>tabnew<CR>", "New Tab" },
			p = { "<Cmd>Lazy<CR>", "Lazy" },
			["lJ"] = { "<Cmd>silent !jq . \"%\" > /tmp/jqout && cat /tmp/jqout > \"%\"<CR>", "Format JSON" },
		},
	})
end

return {
	"folke/which-key.nvim",
	dependencies = { "folke/lazy.nvim" },
	config = config,
}
