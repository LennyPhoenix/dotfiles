local function keybinds()
	require("which-key").register({
		["<leader>m"] = { "<Cmd>Mason<CR>", "Mason" },
	})
end

local function config()
	require("mason").setup()
	keybinds()
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"which-key.nvim",
	},
	config = config,
}
