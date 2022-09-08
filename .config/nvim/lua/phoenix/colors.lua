-- Set Colorscheme Safely
local colorscheme = "ayu"

local colors_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not colors_status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
end
