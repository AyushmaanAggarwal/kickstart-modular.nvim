-- Save and Run Current File
-- Written By: Ayushmaan Aggarwal(2024)

local save_and_exec = function()
  local file_type = vim.api.nvim_buf_get_option(0, 'filetype')
  local file_name = vim.api.nvim_buf_get_name(0):gsub('%s', '\\ ') -- Get file name of file in current buffer

  if file_type == 'vim' or file_type == 'lua' then
    vim.cmd 'source %'
  elseif file_type == 'python' then
    vim.cmd('terminal python3 ' .. file_name)
  elseif file_type == 'c' then
    vim.cmd 'make'
  end
end
vim.keymap.set('n', '<leader>rf', save_and_exec, { desc = '[R]un [F]ile' })
