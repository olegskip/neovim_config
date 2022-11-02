return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  vim.cmd('set guicursor= ')-- to prevent changing cursor when exiting nvim
  vim.opt.termguicolors = true
    
  use {'neoclide/coc.nvim', branch = 'release'} -- dropout menu and many ide features needs nodejs, uses(i configured) lsp server ccls
  require('coc_nvim_loader')

  use 'github/copilot.vim'

  use 'numToStr/Comment.nvim'
  require('Comment').setup()

  -- use('tpope/vim-unimpaired')
  use 'vim-airline/vim-airline' -- status bar
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'} -- tabline
  use 'p00f/nvim-ts-rainbow'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = { "c", "lua", "rust", "python" },
      
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      
      -- List of parsers to ignore installing (for "all")
      ignore_install = { "javascript" },
      
      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
      
      highlight = {
          -- `false` will disable the whole extension
          enable = true,
    
          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        --disable = { "c", "rust" },
        
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
      },
      rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
  }
  
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  -- empty setup using defaults
  require('nvim-tree').setup()
  
  local opts = { noremap = true, silent = true, replace_keycodes = false}
  local keymap = vim.api.nvim_set_keymap
  keymap('n','<F2>', ':NvimTreeToggle<cr>', opts)

  keymap("i", "<C-L>", "<Esc>o", {silent = true})
  keymap("i", "<C-K>", "<Esc>O", {silent = true})
  vim.keymap.set({'i', 'n'}, '<C-UP>', function() require "line_functions".swap_with_line_above() end)
  vim.keymap.set({'i', 'n'}, '<C-DOWN>', function() require "line_functions".swap_with_line_below() end)

  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

  keymap('','<C-z>', ':undo<cr>', opts)

  use 'sakhnik/nvim-gdb'

  vim.g.termguicolors = true

  use 'lukas-reineke/indent-blankline.nvim'

  
  vim.cmd [[highlight IndentBlanklineIndent1 guifg=#404040]]
  -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#ffffff]]

  require("indent_blankline").setup {
      -- char = "",
      char_highlight_list = {
          "IndentBlanklineIndent1",
      },
      space_char_highlight_list = " ",
      -- show_trailing_blankline_indent = false,
  }

  use 'tomasiser/vim-code-dark'
  
  vim.o.number = true -- show numbers on the left
  vim.o.pumheight = 10 -- limit dropout menu
  vim.o.autoindent = true
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.g.nocompatible = true
  
  vim.cmd("colorscheme codedark") -- should be after theme
  vim.cmd("highlight clear SignColumn") -- should be after theme
end)