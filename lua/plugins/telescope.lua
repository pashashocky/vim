local status, telescope = pcall(require, "telescope")
if not status then
    return
end
local actions = require("telescope.actions")

-- Credit https://github.com/nvim-telescope/telescope.nvim/issues/223#issuecomment-810091610
-- Prevent telescope from previewing binary files
local previewers = require("telescope.previewers")
local Job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job
        :new({
            command = "file",
            args = { "--mime-type", "-b", filepath },
            on_exit = function(j)
                local mime_type = vim.split(j:result()[1], "/")[1]
                if mime_type == "text" then
                    previewers.buffer_previewer_maker(filepath, bufnr, opts)
                else
                    -- maybe we want to write something to the buffer here
                    vim.schedule(function()
                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                    end)
                end
            end,
        })
        :sync()
end

telescope.setup({
    defaults = {
        prompt_prefix = " 🔭 ",
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                preview_height = 0.6,
                height = 0.8,
                width = 0.8,
            },
        },
        file_ignore_patterns = {
            "dist/.*",
            ".git",
            "node%_modules/.*",
            "tags",
            "target/",
            "tmp/.*",
            "undo/.*",
        },
        set_env = { ["COLORTERM"] = "truecolor" },
        buffer_previewer_maker = new_maker,
        mappings = {
            n = { ["q"] = actions.close },
            i = { ["<esc>"] = actions.close },
        },
    },
})

telescope.load_extension("fzf")
