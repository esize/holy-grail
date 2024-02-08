-- set line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- set appropriate tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto-indent
vim.opt.smartindent = true

-- disable line wrapping
vim.opt.wrap = false

-- undo forever
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- don't highlight every searched term forever
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- keep pretty terminal colors
vim.opt.termguicolors = true

-- leave at least 8 lines at bottom while scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

-- update quickly
vim.opt.updatetime = 50

-- disable netrw banner
vim.g.netrw_banner = 0

vim.g.netrw_list_hide= "^\\.git,^\\.DS_Store"
