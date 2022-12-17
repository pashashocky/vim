-- n, v, i, t = mode names

local M = {}

M.general = {
  n = {
    ["<leader><tab>"] = {
      '<cmd> call feedkeys("\\<Plug>(prev)") <CR>',
      "previous buffer|tab|window",
    },
    ["<leader>fs"] = { "<cmd> w <CR>", "save file" },
    ["<C-Space>"] = { "<cmd> WhichKey \\<leader> <CR>", "open WhichKey" },

    -- windows
    ["<leader>wv"] = { "<C-w>v", "split vertical" },
    ["<leader>wh"] = { "<C-w>s", "split horizontal" },
    ["<leader>wx"] = { "<cmd> close <CR>", "close window" },

    -- tabs
    ["<leader>to"] = { "<cmd> tabnext <CR>", "next tab" },
    ["<leader>tn"] = { "<cmd> tabprev <CR>", "previous tab" },
    ["<leader>tc"] = { "<cmd> tabnew % <CR>", "new tab" },
    ["<leader>tx"] = { "<cmd> tabclose <CR>", "close tab" },
    ["<leader>ti"] = { "<cmd> tabonly <CR>", "keep only this tab" },

    -- center search results
    ["n"] = { "nzz", "next search" },
    ["N"] = { "Nzz", "previous search" },

    ["<leader>dd"] = { '"_dd', "delete line without copy" },
  },

  v = {
    [">"] = { ">gv", "indent right" },
    ["<"] = { "<gv", "indent left" },
  },
}

M.packer = {
  n = {
    ["<leader>up"] = { "<cmd> PackerUpdate <CR>", "packer update" },
    ["<leader>ui"] = { "<cmd> PackerInstall <CR>", "packer install" },
    ["<leader>us"] = { "<cmd> PackerSync <CR>", "packer sync" },
    ["<leader>uc"] = { "<cmd> PackerCompile <CR>", "packer compile" },
  },
}

M.nvimtree = {
  n = {
    ["<C-f>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.leap = {
  plugin = true,
  n = {
    ["s"] = {
      '<cmd> call feedkeys("\\<Plug>(leap-forward)") <CR>',
      "leap forward to",
    },
    ["S"] = {
      '<cmd> call feedkeys("\\<Plug>(leap-backward)") <CR>',
      "leap backward to",
    },
    ["gs"] = {
      '<cmd> call feedkeys("\\<Plug>(leap-cross-window)") <CR>',
      "leap cross window",
    },
  },
}

M.glance = {
  plugin = true,
  n = {
    ["gd"] = { "<CMD>Glance definitions<CR>", "glance definitions" },
    ["gr"] = { "<CMD>Glance references<CR>", "glance references" },
    ["gi"] = { "<CMD>Glance implementations<CR>", "glance implementations" },
    ["<leader>D"] = { "<CMD>Glance type_definitions<CR>", "glance type definitions" },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<S-l>"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "harpoon mark" },
    ["<S-u>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "harpoon mark" },
    ["<S-h>"] = { "<cmd>Telescope harpoon marks<CR>", "harpoon marks telescope" },
    ["<S-m>1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "harpoon go to mark 1" },
    ["<S-m>2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "harpoon go to mark 2" },
    ["<S-m>3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "harpoon go to mark 3" },
    ["<S-m>4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "harpoon go to mark 4" },
    ["<S-m>5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "harpoon go to mark 5" },
    ["<S-m>6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", "harpoon go to mark 6" },
    ["<S-m>7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", "harpoon go to mark 7" },
    ["<S-m>8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", "harpoon go to mark 8" },
    ["<S-m>9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<CR>", "harpoon go to mark 9" },
    ["<S-m>0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<CR>", "harpoon go to mark 10" },
  },
}

return M
