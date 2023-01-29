local ok, builtin = pcall(require, "telescope.builtin")
if not ok then
	return
end

local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local is_projects_loaded, _ = pcall(require, 'project_nvim')
if is_projects_loaded then
	telescope.load_extension('projects')
end

local is_undo_loaded, _ = pcall(require, 'telescope-undo')
if is_undo_loaded then
	telescope.load_extension('undo')
	vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
end

telescope.setup{

}
