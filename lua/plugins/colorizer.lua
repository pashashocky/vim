local status, colorizer = pcall(require, "colorizer")
if not status then
    return
end

local option = vim.o

if option.termguicolors then
    colorizer.setup() -- can add a table with file type names
end
