local M = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- python
    "python-lsp-server",
    "isort",
    "black",
    "mypy",

    -- web dev
    "typescript-language-server",
    "tailwindcss-language-server",
    "eslint_d",
    "prettierd",

    -- shell
    "shfmt",
    "shellcheck",
  },
}

return M
