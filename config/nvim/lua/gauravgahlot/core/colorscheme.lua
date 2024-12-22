-- vim.cmd "colorscheme default"

-- local cs = "tokyonight-day"
local cs = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. cs)
if not status_ok then
	print("Colorsheme " .. cs .. " not found!")
	return
end
