return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	function _G.executable(command)
		return vim.fn.executable(command) ~= 0
	end	

	vim.cmd('set guicursor= ')-- to prevent changing cursor
	vim.cmd('set relativenumber')
	vim.opt.termguicolors = true
	vim.o.number = true -- show numbers on the left
	vim.o.pumheight = 10 -- limit dropout menu
	vim.o.autoindent = true
	vim.o.tabstop = 4
	vim.o.shiftwidth = 4
	vim.g.nocompatible = true
	vim.o.clipboard = "unnamedplus"
	-- Allow NeoVim to set terminal title
	vim.o.title = true
		
	use 'tomasiser/vim-code-dark'

	use "williamboman/mason.nvim"
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
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
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim' -- for telescope
	use 'lewis6991/impatient.nvim'
	use 'stevearc/aerial.nvim'
	use 'ahmedkhalf/project.nvim'
	use 'debugloop/telescope-undo.nvim'
	use 'simrat39/symbols-outline.nvim'
	
	vim.cmd("colorscheme codedark")
	vim.cmd("highlight clear SignColumn") -- should be after theme
	require("mason").setup()
	require('nvim-cmp_config')
	require('lspconfig_config')
	require('Comment').setup()
	require('bufferline_config')
	require('treesitter_config')
	require('indent_blankline_config')
	require('nvim-tree_config')
	require('copilot_config')
	require('keymaps_config')
	require('telescope_config')
	require('impatient')
	require('aerial_config')
	require("project_nvim").setup()
	require("symbols-outline").setup()
end)