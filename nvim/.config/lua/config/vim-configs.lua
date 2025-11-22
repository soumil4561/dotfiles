-- lua/config/vim-configs.lua

-- Line numbers
vim.opt.number = true      -- Show absolute line numbers
vim.opt.relativenumber = false  -- Relative line numbers

-- Tab and Indentation
vim.opt.tabstop = 4        -- Number of spaces for a tab
vim.opt.shiftwidth = 4     -- Number of spaces for indentation
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.autoindent = true  -- Auto-indent new lines

-- Search
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true   -- Case-sensitive when uppercase is used
vim.opt.incsearch = true   -- Show search results as you type
vim.opt.hlsearch = true    -- Highlight search results

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Mouse Support
vim.opt.mouse = "a"        -- Enable mouse for all modes

-- Split Windows
vim.opt.splitright = true  -- Open new vertical splits to the right
vim.opt.splitbelow = true  -- Open new horizontal splits below

-- Appearance
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"    -- Always show the sign column to avoid shifting
vim.opt.cursorline = true     -- Highlight the current line

-- Scrolloff (better scrolling)
vim.opt.scrolloff = 8         -- Keep 8 lines visible when scrolling

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true   -- Persistent undo

-- Faster updates
vim.opt.updatetime = 300

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Set leader key (if not set elsewhere)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"