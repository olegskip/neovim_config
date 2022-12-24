local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		tab_size = 20,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")"
		end,
		diagnostics_update_in_insert = true,
		offsets = {
			{	
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true
			}
		},
		always_show_bufferline = true,
		close_command = "Bdelete! %d" -- from bufdelete plugin, origin bdelete spoils my layout(it sometimes jumps to nvim-tree after closing a bufffer)
	}
})

-- TODO REWRITE IN LUA
vim.cmd('nnoremap <silent>b] :BufferLineCycleNext<CR>')
vim.cmd('nnoremap <silent>b[ :BufferLineCyclePrev<CR>')