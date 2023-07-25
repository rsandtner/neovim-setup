
local colorscheme = "habamax"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
