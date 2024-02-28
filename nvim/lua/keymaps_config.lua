vim.keymap.set('n','<C-Q>', function() require('bufdelete').bufdelete(0, false) end)
vim.keymap.set("i", "<C-L>", "<Esc>o")
vim.keymap.set("i", "<C-K>", "<Esc>O")
vim.keymap.set({'i', 'n'}, '<C-UP>', function() require "line_functions".swap_with_line_above() end)
vim.keymap.set({'i', 'n'}, '<C-DOWN>', function() require "line_functions".swap_with_line_below() end)

vim.keymap.set('n','<C-Z>', ':undo<CR>')
vim.keymap.set({'i', 'n'}, '<C-F>', function() vim.lsp.buf.format() end)
