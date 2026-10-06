local opt = vim.opt

-- Leader. Must be set before lazy.nvim loads plugins, so it lives here at the
-- top of the startup path.
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Line numbers and gutter
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.scrolloff = 8
-- Wrapping. Off by default so code scrolls horizontally; prose filetypes turn
-- it on (see autocmds.lua). `linebreak` wraps at word boundaries and
-- `breakindent` keeps the leading indent, and both are inert while wrap is off.
opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.termguicolors = true
opt.showmode = false

-- Indentation. The default is 2 spaces; autocmds.lua raises it to 4 for
-- Markdown.
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Splits open where you expect
opt.splitright = true
opt.splitbelow = true

-- Files and undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400

-- Completion menu
opt.completeopt = { 'menuone', 'noselect' }
opt.pumheight = 12

-- Folding. Treesitter is not installed here, so folds are indent-based.
-- foldlevel 99 keeps everything open by default; `za`/`zc` still work.
opt.foldmethod = 'indent'
opt.foldlevel = 99

-- Use the system clipboard when a provider is available.
opt.clipboard = 'unnamedplus'
