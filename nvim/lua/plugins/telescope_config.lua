local ok, builtin = pcall(require, "telescope.builtin")
if not ok then
	return
end

local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

vim.keymap.set('n', '<leader>fd', builtin.resume, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fF', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fs', builtin.search_history, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fG', function() builtin.live_grep({search_dirs={vim.fn.expand("%:p")}}) end)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

local is_undo_loaded, _ = pcall(require, 'telescope-undo')
if is_undo_loaded then
	telescope.load_extension('undo')
	vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
end

telescope.setup{

}
