local o = vim.opt

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.termguicolors = true
o.scrolloff = 8
o.wrap = false

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = true

o.splitright = true
o.splitbelow = true

o.undofile = true
o.swapfile = false
o.updatetime = 250
o.timeoutlen = 400
o.clipboard = "unnamedplus"
o.mouse = "a"
o.completeopt = { "menu", "menuone", "noselect" }
o.showmode = false 

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  severity_sort = true,
  float = { border = "rounded", source = true },
})
