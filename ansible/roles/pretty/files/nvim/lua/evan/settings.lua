-- set the cursor to default (no special cursor)
vim.opt.guicursor = ""

-- enable line numbers and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- set tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable smart indentation
vim.opt.smartindent = true

-- turn off line wrapping
vim.opt.wrap = false

-- disable swap/backup, and enable undo features
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable highlighting of search results, but enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- enable true color support in the terminal
vim.opt.termguicolors = true

-- set scroll offset and display sign column
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- weird prime magic i don't wanna mess with
vim.opt.isfname:append("@-@")

-- set cursor time to 50ms
vim.opt.updatetime = 50

-- highlight the 80th column
vim.opt.colorcolumn = "80"

-- file explorer settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
