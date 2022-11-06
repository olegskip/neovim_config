local opts = { noremap = true, silent = true, replace_keycodes = false}
local keymap = vim.api.nvim_set_keymap
keymap('n','<F2>', ':NvimTreeToggle<cr>', opts)
-- asdasd
keymap("i", "<C-L>", "<Esc>o", {silent = true})
keymap("i", "<C-K>", "<Esc>O", {silent = true})
vim.keymap.set({'i', 'n'}, '<C-UP>', function() require "line_functions".swap_with_line_above() end)
vim.keymap.set({'i', 'n'}, '<C-DOWN>', function() require "line_functions".swap_with_line_below() end)

keymap('n','<C-Z>', ':undo<CR>', opts)
