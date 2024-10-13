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
  local raw_file_name = vim.api.nvim_buf_get_name(0)
  local file_name = raw_file_name:gsub('%s', '\\ ')
  local raw_file_pdf = string.sub(raw_file_name, 1, -3) .. "pdf"
  local file_pdf = raw_file_pdf:gsub('%s', '\\ ')
  vim.print(file_pdf)

  if file_type == 'md' or file_type == "vimwiki" then
    vim.cmd(string.format(":!pandoc -s %s -o %s --pdf-engine=pdflatex &", file_name, file_pdf))
    vim.cmd(string.format(":silent !nohup org.kde.okular %s &", file_pdf))
  end
end

local edit_snippets = function()
  require("luasnip.loaders").edit_snippet_files()
end

local paste_image = function()
  local file_name = vim.fn.input("Get file name: ")
  vim.cmd(":!wl-paste --type image/png > " .. file_name)
end

-- Keymaps
vim.keymap.set('n', '<leader>rf', save_and_exec, { desc = '[R]un [F]ile' })
vim.keymap.set('n', '<leader>rd', compile_document, { desc = '[R]un [D]ocument' })
vim.keymap.set('n', '<leader>e', edit_snippets, { desc = '[R]un [D]ocument' })
vim.keymap.set('n', '<leader>rp', paste_image, { desc = 'r [Paste] Image' })

-- Quarto
-- local quarto = require('quarto')
-- quarto.setup()
-- vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, { silent = true, noremap = true })
