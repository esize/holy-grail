require("evan.settings")
require("evan.remap")
require("evan.lazy_init")

local augroup = vim.api.nvim_create_augroup
local EvanGroup = augroup('Evan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
