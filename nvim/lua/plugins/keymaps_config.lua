vim.keymap.set('n','<F2>', ':NvimTreeToggle<cr>')
vim.keymap.set("i", "<C-L>", "<Esc>o")
vim.keymap.set("i", "<C-K>", "<Esc>O")
vim.keymap.set({'i', 'n'}, '<C-UP>', function() require "line_functions".swap_with_line_above() end)
vim.keymap.set({'i', 'n'}, '<C-DOWN>', function() require "line_functions".swap_with_line_below() end)

vim.keymap.set('n','<C-Z>', ':undo<CR>')
