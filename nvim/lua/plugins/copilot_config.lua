local ok, copilot = pcall(require, 'copilot')
if not ok then
	return
end

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.cmd('autocmd VimEnter * call timer_start(10, { tid -> execute(\'Copilot disable\')})')