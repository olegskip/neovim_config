local line_functions = {}

function line_functions.insert_line_above()
  vim.api.nvim_put({''}, 'l', false, false)
end

function line_functions.insert_line_below()
  vim.api.nvim_put({''}, 'l', true, false)
end

return line_functions
