local ok, ibl = pcall(require, "ibl")
if not ok then
	return
end

vim.cmd("highlight IndentBlanklineIndent1 guifg=#404040")
ibl.setup({
    indent = {
        smart_indent_cap = false -- show all indentation, not just based on surrounding
    },
    scope = {
        enabled = false;
    }
})
