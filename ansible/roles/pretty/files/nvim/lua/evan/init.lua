require("evan.settings")
require("evan.remap")
require("evan.lazy_init")

local augroup = vim.api.nvim_create_augroup
local EvanGroup = augroup('Evan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


-- Function to reload a Lua module
function R(name)
    require("plenary.reload").reload_module(name)
end

-- Add file extension association for filetype
vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

-- Autocommand to highlight yanked text after yanking
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})


-- Autocommand to remove trailing whitespace before writing a file
autocmd({"BufWritePre"}, {
    group = EvanGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Autocommand to set up LSP keybindings upon attaching
autocmd('LspAttach', {
    group = EvanGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        -- go to definition of the symbol under the cursor
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

        -- show hover information for symbol under the cursor
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

        -- search for symbols in the workspace
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

        -- open the floating window displaying diagnostics for the current buffer
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

        -- provide code actions for the current cursor position
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

        -- find references to the symbol under the cursor
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

        -- rename the symbol under the cursor
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

        -- show signature help for the function or method call at the cursor position
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        -- navigate to the next error or warning in the current buffer
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)

        -- navigate to the previous error or warning in the current buffer
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
