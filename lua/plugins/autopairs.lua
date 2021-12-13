local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    return
end

local status1, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local status2, cmp = pcall(require, "cmp")

if status1 and status2 then
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
    },
    disable_filetype = { "TelescopePrompt" },
})
