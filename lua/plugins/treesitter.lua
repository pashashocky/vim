local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
    autopairs = { enable = true },
    autotag = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = false,
    },
    ensure_installed = {
        "bash",
        "c",
        "css",
        "fish",
        "go",
        "godot_resource",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "php",
        "python",
        "regex",
        "rust",
        "scss",
        "swift",
        "toml",
        "tsx",
        "vim",
        "yaml",
    },
})
