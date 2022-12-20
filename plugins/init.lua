return {
  -- Default plugins

  ["goolord/alpha-nvim"] = {
    rm_default_opts = true,
    after = "base46",
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["folke/which-key.nvim"] = {
    rm_default_opts = true,
    config = function()
      require "plugins.configs.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
    override_options = {
      triggers_blacklist = {
        n = { "y", "d", "v", "g", "c" },
      },
    },
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = require "custom.plugins.treesitter",
  },

  ["williamboman/mason.nvim"] = {
    override_options = require "custom.plugins.mason",
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = require "custom.plugins.nvimtree",
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lsp.lspconfig"
    end,
  },

  -- User plugins

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.lsp.null-ls"
    end,
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
  },

  ["kylechui/nvim-surround"] = {
    tag = "*",
    keys = { "ys", "cs", "ds", "v", "<S-v>", "<C-v>", "<C-g>" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  ["mg979/vim-visual-multi"] = {
    keys = { "<C-n>" },
  },

  ["ggandor/leap.nvim"] = {
    config = function()
      local leap = require "leap"
      leap.setup {
        labels = { "t", "n", "s", "e", "r", "i", "a", "o", "g", "m" },
        safe_labels = { "t", "n", "s", "e", "r", "i", "a", "o", "g", "m" },
      }
      leap.add_default_mappings()
    end,
    setup = function()
      require("core.lazy_load").on_file_open "leap.nvim"
      require("core.utils").load_mappings "leap"
    end,
  },

  ["ggandor/flit.nvim"] = {
    config = function()
      require("flit").setup {}
    end,
    setup = function()
      require("core.lazy_load").on_file_open "flit.nvim"
    end,
  },

  ["dnlhc/glance.nvim"] = {
    config = function()
      require "custom.plugins.glance"
    end,
    setup = function()
      require("core.lazy_load").on_file_open "glance.nvim"
      require("core.utils").load_mappings "glance"
    end,
  },

  ["ThePrimeagen/harpoon"] = {
    config = function()
      local status_ok, telescope = pcall(require, "telescope")
      if not status_ok then
        return
      end
      telescope.load_extension "harpoon"
    end,
    setup = function()
      require("core.lazy_load").on_file_open "harpoon"
      require("core.utils").load_mappings "harpoon"
    end,
  },
}
