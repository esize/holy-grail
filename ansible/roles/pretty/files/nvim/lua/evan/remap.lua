vim.g.mapleader = " "

-- use " pv" to go to explore current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- when line(s) are highlighted, use J or K to move them
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- bring the next line to the end of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- scroll up and down half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor stays in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste and send current selection to void
vim.keymap.set("x", "<leader>p", "\"_dP")

-- delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- <leader>y will yank into the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Q is not good for anything?
vim.keymap.set("n", "Q", "<nop>")

-- find and replace all instances of the word the cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- if in bash file, <leader>x makes the file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source the current file on double space
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
