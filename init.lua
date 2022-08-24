--
--   ┏━┓╻ ╻┏━┓┏━╸╻┏ ╻ ╻   ╻ ╻╻┏┳┓┏━┓┏━╸
--   ┗━┓┣━┫┃┃┃┃  ┣┻┓┗┳┛   ┃┏┛┃┃┃┃┣┳┛┃
--   ┗━┛╹ ╹┗━┛┗━╸╹ ╹ ╹    ┗┛ ╹╹ ╹╹┗╸┗━╸
--
--   UPDATED on 11/12/2021
--

vim.opt.termguicolors = true

require("plugins")
require("options")
require("mapping")
require("highlights")

require("autocommands")

require("plugins.autopairs")
require("plugins.blankline")
require("plugins.bufferline")
require("plugins.choosewin")
require("plugins.cmp")
require("plugins.colorizer")
require("plugins.easymotion")
require("plugins.gitsigns")
require("plugins.goto")
require("plugins.lsp-signature")
require("plugins.lspconfig")
require("plugins.lspkind")
require("plugins.lspsaga")
require("plugins.null-ls")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.tmux-navigator")
require("plugins.toggleterm")
require("plugins.treesitter")
require("plugins.twilight")

-- language specific
require("plugins.go-nvim")
require("luasnip/loaders/from_vscode").lazy_load()
require("lsp.efm")
require("icons")

-- Coloscheme
-- vim.cmd("colorscheme shocky")
