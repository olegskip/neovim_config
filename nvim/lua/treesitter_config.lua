local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup({
	ensure_installed = { 'c', 'lua', 'rust', 'python' },

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},

	rainbow = { -- fromn vim-ts-rainbow
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil
	},

	textsubjects = {
		enable = true,
		prev_selection = ',', -- (Optional) keymap to select the previous selection
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},
})