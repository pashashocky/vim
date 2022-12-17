local options = {
  relativenumber = true, -- relative line numbers
  lazyredraw = true, -- no redraw while executing macros
  confirm = true, -- Confirm quitting unsaved, rather than error

  ignorecase = true, -- Case incensitive searches
  smartcase = true, -- Override ignorecase if uppercase typed
  incsearch = true, -- Incremental search while typing

  fileencoding = "utf-8", -- the encoding written to a file
  scrolloff = 12, -- Vertical scroll boundary
  sidescroll = 12, -- Horizontal scroll boundary

  backspace = "indent,eol,start",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
