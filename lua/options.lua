local option = vim.opt
local exec = vim.api.nvim_exec

-- General
option.title = true -- Set window title
option.background = "dark" -- Dark background, also light
option.mouse = "a" -- Allow mouse to select without numbers
option.backspace = "2" -- Make backspace work like most other apps
option.updatetime = 250 -- Makes things snappy
option.splitright = true -- Natural split
option.showmatch = true -- Show matching brace
option.showmode = false -- No need to always show editing mode
option.showtabline = 2 -- Always show the tabline
option.matchtime = 3 -- Speeding things up from above
option.tags = "./.tags;/" -- Allow vim to search for tags
option.wrap = false -- Disable wrapping
option.hidden = true -- Allows to hide files, without the need to save
option.confirm = true -- Confirm quitting unsaved, rather than error
option.equalalways = true -- Makes splits equal size
option.lazyredraw = true -- No redraw while executing macros (Much Faster)
option.spelllang = "en_us" -- Spell check with us eng
option.gdefault = true -- Replace everything by default :S
option.visualbell = true -- Stop the bell

-- Solid instead of broken line for vert splits
option.fcs = "vert:│,fold:-,eob: "
-- Shorter err msgs :h shortmess
option.shortmess:append("atc")
-- In/de-crease  numbers with C-a/C-x
option.nrformats:append("alpha")
-- Copy to the system clipboard
option.clipboard:append({ "unnamed", "unnamedplus" })
-- Don't show preview window
option.completeopt:remove("preview")

-- Disable automatic comment propagation
exec([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]], true)
-- Dynamic call to color column
exec([[ call matchadd('ColorColumn', '\%81v', 100) ]], true)
-- Hack indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
option.colorcolumn = "99999"

-- Line numbers and cursor
option.number = true -- Line numbers
option.relativenumber = true -- Relative numbers
option.cursorline = true
option.nuw = 1 -- Number of columns occupied by numbers
option.ruler = true -- Tells you line number, and position

-- Extra chars
option.signcolumn = "yes"
option.list = true
option.listchars = "tab:\\ ,trail:-,eol: "

-- Searches
option.ignorecase = true -- Case incensitive searches
option.smartcase = true -- Override ignorecase if uppercase typed
option.incsearch = true -- Incremental search (while typing)

-- Scroll offs
option.scrolloff = 12 -- Vertical scroll boundary
option.sidescroll = 12 -- Horizontal scroll boundary

-- Backup swap files
option.backup = true
option.backupdir = vim.env.HOME .. "/.config/nvim/tmp"
option.backupskip = "/tmp/*,/private/tmp/*"
option.directory = vim.env.HOME .. "/.config/nvim/tmp"
option.writebackup = true

-- Infinite undo
option.undofile = true
option.undodir = vim.env.HOME .. "/.config/nvim/undo"
option.undolevels = 1000
option.undoreload = 10000

-- Folding
option.foldignore = "" -- don't ignore anything when folding
option.foldlevelstart = 99 -- no folds closed on open
option.foldmethod = "expr" -- collapse code using markers
option.foldexpr = "nvim_treesitter#foldexpr()" -- TODO: Look into this

-- Tabbing
option.tabstop = 4 -- spaces for editing
option.shiftwidth = 4 -- spaces for autoindenting
option.softtabstop = 0 -- size of tabs
option.expandtab = true -- replace tabs with spaces
option.smartindent = true
option.smarttab = true
option.cindent = true
