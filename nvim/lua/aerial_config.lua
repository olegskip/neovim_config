local ok, aerial = pcall(require, 'aerial')
if not ok then
	return
end

aerial.setup({
	on_attach = function(bufnr)
	  vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
	  vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
	end,

	layout = {
		min_width = 20,
		default_direction = "prefer_right",
	}
})

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
