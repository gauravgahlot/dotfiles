-- vim.cmd "colorscheme default"

local cs = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. cs)
if not status_ok then
   print("Colorsheme " .. cs .. " not found!")
   return
end


