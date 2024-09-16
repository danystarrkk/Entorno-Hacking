local keymapc = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

--global keymaps

keymapc("i", "jk", "<ESC>", { noremap = true }) --Esc
