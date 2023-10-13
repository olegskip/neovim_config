return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	function _G.executable(command)
		return vim.fn.executable(command) ~= 0
	end	
		
	use { 'catppuccin/nvim', as = 'catppuccin' }
	require('catppuccin').setup({
		flavour = 'macchiato', -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = 'macchiato',
			dark = 'macchiato',
    	},
	})

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'

	use 'numToStr/Comment.nvim'
	use 'vim-airline/vim-airline' -- status bar
	use {'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'kyazdani42/nvim-web-devicons'} -- tabline
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
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim' -- for telescope
	use 'lewis6991/impatient.nvim'
	use 'stevearc/aerial.nvim'
	use 'debugloop/telescope-undo.nvim'
	use 'simrat39/symbols-outline.nvim'
	use 'RRethy/nvim-treesitter-textsubjects'
    use 'kylechui/nvim-surround'

	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'

	require('keymaps_config')

	require('impatient')
	require('plugins/nvim-cmp_config')
	require('plugins/lspconfig_config')
	require('Comment').setup()
	require('plugins/bufferline_config')
	require('plugins/treesitter_config')
	require('plugins/indent_blankline_config')
	require('plugins/nvim-tree_config')
	require('plugins/telescope_config')
	require('plugins/aerial_config')
	require('symbols-outline').setup()
    require('nvim-surround').setup()
	require('plugins/dap_config')
end)
