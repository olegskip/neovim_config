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
    open_on_tab = false,
})

vim.keymap.set('n','<F2>', ':NvimTreeToggle<cr>')
vim.keymap.set('n','<F3>', ':NvimTreeFindFile!<cr>') -- ! forces to find the file even it isn't in CWD/**/

