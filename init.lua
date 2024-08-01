  -- ❪   ❫ editor ↴
  --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.clipboard = {
    name = "copyq",
	  copy = { ["+"] = "copyq copy",
			       ["*"] = "copyq copy", },
		paste = { ["+"] = "copyq paste",
	            ["*"] = "copyq paste", },
		cache_enabled = 1, }
vim.g.wildmenu = "fuzzy"
vim.g.wildmode = "list"
vim.g.loaded_perl_provider = 0
vim.o.cmdheight = 0
vim.o.number = true
--vim.o.relativenumber = true
vim.o.wrap = true
vim.o.whichwrap = 'b,s,<,>,[,]'
vim.o.breakindent = true
vim.o.hidden = false
vim.o.autoread = true
vim.o.smartindent = false
vim.o.autoindent = true
vim.o.termguicolors = true
vim.o.winheight = 999
vim.o.winwidth = 999
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.ruler = true
vim.o.confirm = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.history = 1000
vim.o.cursorline = true
vim.o.cdhome = true
vim.o.undofile = true
vim.o.linebreak = true


    -- Copying to system clipboard
    -- From current cursor position to EOL (normal mode)
  vim.keymap.set({'n'}, '<C-c>', '"+y$')
    -- Current selection (visual mode)
  vim.keymap.set({'v'}, '<C-c>', '"+y')

    -- Cutting to system clipboard
    -- From current cursor position to EOL (normal mode)
  vim.keymap.set({'n'}, '<C-x>', '"+d$')
    -- Current selection (visual mode)
  vim.keymap.set({'v'}, '<C-x>', '"+d')

    -- Pasting from system clipboard
    -- From current cursor position to EOL (normal mode)
    vim.keymap.set({'n'}, 'C-v', '"+p$')
    -- Current selection (visual mode)
    vim.keymap.set({'v'}, 'C-v', '"+p')


-- ❪   ❫ require ↴
  --
	require('lazyBOOT')
	require('plugINIT')
	require('neovide')




