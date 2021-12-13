local status, toggleterm = pcall(require, "toggleterm")
if not status then
    return
end

toggleterm.setup({
    open_mapping = [[<leader>t]],
    direction = 'tab',
    insert_mappings = false,
})
