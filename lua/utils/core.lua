local bo = vim.bo
local cmd = vim.cmd
local api = vim.api

local M = {}

-- Delete current buffer
-- Unlike bdelete, this command will jump to next buffer by id
function M.bufdelete()
    if bo.modified then
        cmd("write")
    end

    local bufnr = api.nvim_get_current_buf()

    local buffers = vim.tbl_filter(function(buf)
        return bo[buf].buflisted and api.nvim_buf_is_valid(buf)
    end, api.nvim_list_bufs())

    if bufnr ~= buffers[#buffers] then
        cmd("bprevious")
    else
        cmd("bnext")
    end
    cmd("bdelete " .. bufnr)

    cmd("silent! ScrollViewDisable | bd " .. bufnr .. " | silent! ScrollViewEnable")
end

-- Count number of properties in table
-- Because of lua only count consecutive properties
-- @param T Table
function M.tablelength(T)
    local count = 0

    for _ in pairs(T) do
        count = count + 1
    end

    return count
end

return M
