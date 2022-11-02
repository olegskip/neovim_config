local line_functions = {}

function line_functions.swap_with_line_above()
  local current_pos = vim.api.nvim_win_get_cursor(0)

  if current_pos[1] == 1 then -- there is nothing above, nothing to swap
    return 
  end

  local line_above = vim.api.nvim_buf_get_lines(0, current_pos[1] - 2, current_pos[1] - 1, false)[1] -- nvim_win_get_cursor is 1-indexed
  local current_line = vim.api.nvim_buf_get_lines(0, current_pos[1] - 1, current_pos[1], false)[1]
  vim.api.nvim_buf_set_lines(0, current_pos[1] - 1, current_pos[1], false, {line_above})
  vim.api.nvim_buf_set_lines(0, current_pos[1] - 2, current_pos[1] - 1, false, {current_line})
  
  vim.api.nvim_win_set_cursor(0, {current_pos[1] - 1, current_pos[2]})
end

function line_functions.swap_with_line_below()
  local current_pos = vim.api.nvim_win_get_cursor(0)

  if current_pos[1] == vim.api.nvim_buf_line_count(0) then -- there is nothing below, nothing to swap
    return 
  end

  local line_below = vim.api.nvim_buf_get_lines(0, current_pos[1], current_pos[1] + 1, false)[1] -- nvim_win_get_cursor is 1-indexed
  local current_line = vim.api.nvim_buf_get_lines(0, current_pos[1] - 1, current_pos[1], false)[1]
  vim.api.nvim_buf_set_lines(0, current_pos[1] - 1, current_pos[1], false, {line_below})
  vim.api.nvim_buf_set_lines(0, current_pos[1], current_pos[1] + 1, false, {current_line})
  
  vim.api.nvim_win_set_cursor(0, {current_pos[1] + 1, current_pos[2]})
end

return line_functions
