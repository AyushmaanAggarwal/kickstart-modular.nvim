-- Functions
local save_and_exec = function()
  local file_type = vim.api.nvim_buf_get_option(0, 'filetype')
  local file_name = vim.api.nvim_buf_get_name(0):gsub('%s', '\\ ') -- Get file name of file in current buffer

  if file_type == 'vim' or file_type == 'lua' then
    vim.cmd 'source %'
  elseif file_type == 'python' then
    -- vim.cmd('terminal python3 ' .. file_name)
    vim.cmd('vsplit term://python3 ' .. file_name)
  elseif file_type == 'c' then
    vim.cmd 'make'
  end
end

local compile_document = function()
  -- string.match([[/mnt/tmp/myfile.py]], "(.-)([^\\/]-)([^%.\\/]*)$")
  local file_type = vim.api.nvim_buf_get_option(0, 'filetype')
  local file_name = vim.api.nvim_buf_get_name(0):gsub('%s', '\\ ')
  local file_pdf = string.sub(file_name, 1, -3) .. "pdf"
  vim.print(file_pdf)

  if file_type == 'md' or file_type == "vimwiki" then
    vim.cmd(string.format("!pandoc -s %s -o %s --pdf-engine=lualatex", file_name, file_pdf))
    -- os.execute("org.kde.okular " .. file_pdf)
  end
end


-- Keymaps
vim.keymap.set('n', '<leader>rf', save_and_exec, { desc = '[R]un [F]ile' })
vim.keymap.set('n', '<leader>rd', compile_document, { desc = '[R]un [D]ocument' })
