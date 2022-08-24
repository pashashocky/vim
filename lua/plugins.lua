local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("tpope/vim-sensible")

    -- IDE
    use("neovim/nvim-lspconfig")
    use("tami5/lspsaga.nvim")
    use("ray-x/lsp_signature.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- Completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("rafamadriz/friendly-snippets") -- Snipets for many languages

    -- Tabout from parenthesis, used in cmp
    use({ "abecodes/tabout.nvim", wants = { "nvim-treesitter" } })

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- use 'hrsh7th/cmp-vsnip'
    -- use 'hrsh7th/vim-vsnip'

    -- Editing
    use("ConradIrwin/vim-bracketed-paste") -- avoid :set paste!
    use("mg979/vim-visual-multi") -- Edit multiple places at the same time
    use("tpope/vim-commentary") -- Comment out stuff with gcc
    use("tpope/vim-repeat") -- Plugins integrate with . to repeat last command
    use("tpope/vim-surround") -- surround stuff in vim with other stuff
    use("windwp/nvim-autopairs") -- Auto-close parenthesis and repeat

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Navigation
    use("christoomey/vim-tmux-navigator") -- Navigation between tmux tab
    use("t9md/vim-choosewin") -- select vim windows like tmux, with --
    use("easymotion/vim-easymotion") -- quickly move around the file
    use("kyazdani42/nvim-tree.lua") -- File explorer
    use("ygm2/rooter.nvim") -- Changes directory to the root of the project

    -- Git
    use({ -- Sidebar change signs for vim
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("tpope/vim-fugitive") -- additional git commands and repo management
    use("tpope/vim-rhubarb") -- Github hub

    -- Decoration
    use("sheerun/vim-polyglot") -- Syntax highlighting for many languages
    use("norcalli/nvim-colorizer.lua") -- Colorizer for #fefefe colors in vim
    use("kyazdani42/nvim-web-devicons") -- Icons in vim
    use("onsails/lspkind-nvim") -- Pretty icons in cmp suggestions

    -- Vim UI
    use("rmagatti/goto-preview") -- Preview window for definitions
    use({ -- Top bufferline
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })
    use("hoob3rt/lualine.nvim") -- Bottom statusbar
    use("akinsho/toggleterm.nvim") -- Toggling terminal
    use("lukas-reineke/indent-blankline.nvim") -- Adds indentation guides to lines
    use("mhinz/vim-startify") -- Vim start page
    use("gioele/vim-autoswap") -- Let vim correctly deal with swap files
    use("folke/twilight.nvim") -- Focus on what you currently write

    -- Language Specific
    -- use 'ray-x/go.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
