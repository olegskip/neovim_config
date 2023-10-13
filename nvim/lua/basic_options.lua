local opt = vim.opt

opt.guicursor = { } -- keep the terminal's cursor
opt.mouse = 'a' -- enable mouse
opt.mousemodel = 'extend'
opt.cursorline = true -- highligh the current line
opt.termguicolors = true
opt.number = true --  show the lines' positions on the left
opt.relativenumber = true -- the lines' positions are relative from the current line
opt.pumheight = 10 
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.nocompatible = true
opt.clipboard = 'unnamedplus' -- enables copying/pasting from/to nvim
opt.title = true -- allow NeoVim to set terminal title
vim.o.updatetime = 200
vim.cmd.colorscheme({'catppuccin'})
vim.cmd('highlight clear SignColumn') -- apply the colorsheme to SignColumn, should be after executed after colorscheme applying 
