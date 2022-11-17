local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
	return
end

vim.cmd("highlight IndentBlanklineIndent1 guifg=#404040")
indent_blankline.setup({
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    space_char_highlight_list = " ",
})
