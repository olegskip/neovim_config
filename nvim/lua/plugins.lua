return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	vim.cmd('set guicursor= ')-- to prevent changing cursor
	vim.opt.termguicolors = true
	vim.o.number = true -- show numbers on the left
	vim.o.pumheight = 10 -- limit dropout menu
	vim.o.autoindent = true
	vim.o.tabstop = 4
	vim.o.shiftwidth = 4
	vim.g.nocompatible = true
		
	use 'tomasiser/vim-code-dark'
	use {'neoclide/coc.nvim', branch = 'release'} -- dropout menu and many ide features needs nodejs, uses(i configured) lsp server ccls
	use 'numToStr/Comment.nvim'
	use 'vim-airline/vim-airline' -- status bar
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'} -- tabline
	use 'famiu/bufdelete.nvim' -- for Bdelete
	use 'p00f/nvim-ts-rainbow'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)	
	}
	use 'sakhnik/nvim-gdb'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'github/copilot.vim'
	
	vim.cmd("colorscheme codedark")
	vim.cmd("highlight clear SignColumn") -- should be after theme
	require('coc_config')
	require('Comment').setup()
	require('bufferline_config')
	require('treesitter_config')
	require('indent_blankline_config')
	require('nvim-tree_config')
	require('copilot_config')
	require('keymaps_config')	

end)