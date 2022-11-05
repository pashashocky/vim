local map = vim.api.nvim_set_keymap

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

vim.g.mapleader = " " -- allows to make more extensive keybinds
vim.g.maplocalleader = " " -- with <leader> eg. 'map <leader>n :new<cr>'

--
----------------------------------------
--
--
-- <Enter> (normal): Add new blank line
-- p (normal): Paste code with indent
-- jj (insert): Change to normal mode from insert mode
-- t (terminal): Change to normal mode from terminal mode
-- <Leader>fw (normal): Close current buffer
--
--
----------------------------------------
map("n", "<Enter>", "o<Esc>", options)
map("n", "<leader><Enter>", "O<Esc>", options)
map("i", "jj", "<Esc>", options)
map("t", "<Esc>", "<C-\\><C-n>", options) -- Terminal mode
-- map("n", "<Leader>fw", [[<Cmd>lua require('utils.core').bufdelete()<CR>]], cmd_options)
map("n", "<Leader>fw", ":bp<bar>sp<bar>bn<bar>bd<CR>", cmd_options)
map("n", "<Leader>fx", ":q<CR>", cmd_options)

-- Previous tab/window/buffer
map("n", "<leader><tab>", ':call feedkeys("\\<Plug>(prev)")<CR>', cmd_options)

-- Delete previous word with C-BS
map("i", "<C-BS>", "<C-W>", { noremap = false })

-- Save
map("n", "<leader>fs", ":w<CR>", cmd_options)
map("n", "<leader>fr", ":source $MYVIMRC<CR>", options)

-- Toggle hlsearch for current results
map("n", "<leader>h", ":nohl<CR>", cmd_options)

-- Move lines up/down
map("i", "<C-h>", "<Esc>:m .+1<CR>==gi", cmd_options)
map("i", "<C-j>", "<Esc>:m .-2<CR>==gi", cmd_options)
map("v", "<C-h>", ":m '>+1<CR>gv=gv", cmd_options)
map("v", "<C-j>", ":m '<-2<CR>gv=gv", cmd_options)

-- Movement
map("n", "j", "gj", options)
map("n", "k", "gk", options)
map("v", "j", "gj", options)
map("v", "k", "gk", options)

-- Back/Forth
map("n", "<leader>n", "<C-o>", options)
map("n", "<leader>o", "<C-i>", options)

-- Buffer movement
map("n", "ts", ":split<CR><C-w>w", cmd_options)
map("n", "tv", ":vsplit<CR><C-w>w", cmd_options)
local status = pcall(require, "bufferline")
if status then
    map("n", "tt", ":BufferLineGoToBuffer<Space>", options)
    map("n", "tn", ":BufferLineCyclePrev<CR>", cmd_options)
    map("n", "to", ":BufferLineCycleNext<CR>", cmd_options)
    -- map("n", "td", [[<Cmd>lua require('utils.core').bufdelete()<CR>]], cmd_options)
    map("n", "td", ":bp<bar>sp<bar>bn<bar>bd<CR>", cmd_options)
    map("n", "tD", "<C-w>c", cmd_options)
    -- Allow gf to open non-existing files
    map("n", "gf", ":edit <cfile><CR>", options)
else
    map("n", "tt", "gt", options)
    map("n", "tn", ":tabprev<CR>", options)
    map("n", "to", ":tabnext<CR>", options)
    map("n", "td", ":tabclose<CR>", options)

    map("n", "th", ":tabfirst<CR>", options)
    map("n", "tl", ":tablast<CR>", options)
    map("n", "te", ":tabedit<CR>", options)
    map("n", "tm", ":tabm<Space>", options)
    -- Allow gf to open non-existing files
    map("n", "gf", ":tabe <cfile><CR>", options)
end

-- Center search result
map("n", "n", "nzz", cmd_options)
map("n", "N", "Nzz", cmd_options)

-- Comment toggle
map("n", "<leader>/", ":Commentary<CR>", options)
map("v", "<leader>/", ":Commentary<CR>", options)

-- Remember selection when indenting
map("v", ">", ">gv", cmd_options)
map("v", "<", "<gv", cmd_options)

-- Clipboard management
map("n", "<leader>cy", '"+', options)
map("n", "<leader>cp", '"*', options)
map("v", "<leader>cy", '"+', options)
map("v", "<leader>cp", '"*', options)

-- Delete line without copying to clipboard
map("n", "<leader>dd", '"_dd', options)

-- Super fast search/replace
map("n", "<leader>r", [[:'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/]], options)
map("n", "<leader>R", [[:%s/\<<C-r>=expand('<cword>')<CR>\>/]], options)

-- faster 'dot formula'
map("n", "<leader>x", "*``cgn", options)
map("n", "<leader>X", "#``cgN", options)

-- Easy insertion of training characters from insert mode
map("i", ",,", "<Esc>A,<Esc>", options)
map("i", "::", "<Esc>A:<Esc>", options)

-- Packer
map("n", "<leader>fi", [[:PackerInstall<CR>]], cmd_options)
map("n", "<leader>fu", [[:PackerUpdate<CR>]], cmd_options)

-- LspConfig
status = pcall(require, "lspconfig")
if status then
    map("n", "<Leader>fm", [[<Cmd>lua require('lsp.format').format()<CR>]], cmd_options)
    map("v", "<Leader>fm", [[<Cmd>lua require('lsp.format').range_format()<CR><Esc>]], cmd_options)
end

-- Lspsaga
status = pcall(require, "lspsaga")
if status then
    map("n", "gh", [[:Lspsaga hover_doc<CR>]], cmd_options)
    map("n", "<leader>gh", [[:Lspsaga signature_help<CR>]], cmd_options)
    map("n", "gR", [[:Lspsaga lsp_finder<CR>]], cmd_options)
    local goto_st = pcall(require, "goto-preview")
    if goto_st then
        map("n", "<leader>gd", [[<Cmd>lua require('goto-preview').goto_preview_definition()<CR>]], cmd_options)
    else
        map("n", "<leader>gd", [[:Lspsaga preview_definition<CR>]], cmd_options)
    end

    -- Scroll within definition preview
    map("n", "<C-f>", [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], cmd_options)
    map("n", "<C-b>", [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], cmd_options)

    -- " Refactoring
    map("n", "<leader>ca", [[:Lspsaga code_action<CR>]], cmd_options)
    map("v", "<leader>ca", [[:Lspsaga range_code_action<CR>]], cmd_options)
    map("n", "<leader>rn", [[:Lspsaga rename<CR>]], cmd_options)

    map("n", "<C-q>", [[:Lspsaga diagnostic_jump_prev<CR>]], cmd_options)
    map("n", "<C-b>", [[:Lspsaga diagnostic_jump_next<CR>]], cmd_options)

    -- map("n", "<leader>T", [[:Lspsaga open_floaterm<CR>]], cmd_options)
    -- map("t", "<leader>T", [[<C-\><c-n>:Lspsaga close_floaterm<CR>]], cmd_options)
end

-- Telescope
status = pcall(require, "telescope")
if status then
    map("n", "<leader>ff", [[:lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], cmd_options)
    map("n", "<leader>fc", [[:lua require('telescope.builtin').commands()<CR>]], cmd_options)
    map("n", "<leader>ft", [[:lua require('telescope.builtin').builtin({layout_strategy = 'flex'})<CR>]], cmd_options)

    map("n", "<leader>q", [[:lua require('telescope.builtin').buffers()<CR>]], cmd_options)
    map("n", "<leader>p", [[:lua require('telescope.builtin').find_files()<CR>]], cmd_options)
    map("n", "<leader>P", [[:Telescope file_browser<CR>]], cmd_options)
    map("n", "<leader>a", [[:lua require('telescope.builtin').lsp_code_actions()<CR>]], cmd_options)

    -- Currently, these are the only mappings starting with `;`
    map("n", ";;", ";", cmd_options)
    map("n", ";h", [[:lua require('telescope.builtin').help_tags()<CR>]], cmd_options)
    map("n", ";r", [[:lua require('telescope.builtin').live_grep()<CR>]], cmd_options)
    map("n", ";t", [[:lua require('telescope.builtin').lsp_document_symbols()<CR>]], cmd_options)
    map("n", ";d", [[:lua require('telescope.builtin').diagnostics()<CR>]], cmd_options)

    local goto_st = pcall(require, "goto-preview")
    if goto_st then
        map("n", "gr", [[<Cmd>lua require('goto-preview').goto_preview_references()<CR>]], cmd_options)
        map("n", "gi", [[:lua require('telescope.builtin').lsp_implementations()<CR>]], cmd_options)
        map("n", "gI", [[<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>]], cmd_options)
    else
        map("n", "gr", [[:lua require('telescope.builtin').lsp_references()<CR>]], cmd_options)
        map("n", "gi", [[:lua require('telescope.builtin').lsp_implementations()<CR>]], cmd_options)
    end

    -- Git commits
    map("n", "<leader>gc", [[:lua require('telescope.builtin').git_commits()<CR>]], cmd_options)
    map("n", "<leader>gb", [[:lua require('telescope.builtin').git_branches()<CR>]], cmd_options)
    map("n", "<leader>gs", [[:lua require('telescope.builtin').git_status()<CR>]], cmd_options)

    map("n", "<leader>eg", [[:lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]], cmd_options)
    map("n", "<leader>ee", [[:lua require('telescope.builtin').symbols{ sources = {'emoji'} }<CR>]], cmd_options)
end

-- nvim-tree
status = pcall(require, "nvim-tree")
if status then
    map("n", "<leader>b", [[:NvimTreeToggle<CR>]], cmd_options)
    map("n", "<leader>B", [[:NvimTreeFocus<CR>]], cmd_options)
    map("n", "<leader>fq", [[:NvimTreeToggle<CR>]], cmd_options)
end

-- goto-preview
status = pcall(require, "goto-preview")
if status then
    map("n", "<Leader>z", [[<Cmd>lua require('goto-preview').goto_preview_definition()<CR>]], cmd_options)
    map("n", "<Leader>fX", [[<Cmd>lua require('goto-preview').close_all_win()<CR>]], cmd_options)
end

-- ToggleTerm
map("n", "<leader>T", ":ToggleTermToggleAll<CR>", cmd_options)
function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "jj", [[<C-\><C-n>]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], options)
end

-- Easymotion
map("n", "s", ':call feedkeys("\\<Plug>(easymotion-overwin-f)")<CR>', cmd_options)
map("n", "<leader>j", ':call feedkeys("\\<Plug>(easymotion-j)")<CR>', cmd_options)
map("n", "<leader>k", ':call feedkeys("\\<Plug>(easymotion-k)")<CR>', cmd_options)

-- Tmux-navigation
map("n", "<C-h>", [[:TmuxNavigateLeft<CR>]], cmd_options)
map("n", "<C-j>", [[:TmuxNavigateDown<CR>]], cmd_options)
map("n", "<C-k>", [[:TmuxNavigateUp<CR>]], cmd_options)
map("n", "<C-l>", [[:TmuxNavigateRight<CR>]], cmd_options)
map("n", "<C-\\>", [[:TmuxNavigatePrevious<CR>]], cmd_options)

-- Choosewin
map("n", "--", ':call feedkeys("\\<Plug>(choosewin)")<CR>', cmd_options)
