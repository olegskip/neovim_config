local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	diagnostics = {
		enable = true,
	},
	hijack_cursor = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,

	-- for projects plugin
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	}
})
