local status, toggleterm = pcall(require, "toggleterm")
if not status then
    return
end

toggleterm.setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<leader>t]],
    direction = "vertical",
    insert_mappings = false,
})
