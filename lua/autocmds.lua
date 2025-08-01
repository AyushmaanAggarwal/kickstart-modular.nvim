local autocmd_group = vim.api.nvim_create_augroup('Custom auto-commands', { clear = true })

InFolder = function(folder)
    if string.match(vim.fn.getcwd(), folder) then
      return true
    end
    return false
end

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.py' },
  desc = 'Auto-format Python files after saving',
  callback = function()
    local fileName = vim.api.nvim_buf_get_name(0)
    vim.cmd(':silent !black --preview -q ' .. fileName)
    vim.cmd(':silent !isort --profile black --float-to-top -q ' .. fileName)
    vim.cmd(':silent !docformatter --in-place --black ' .. fileName)
  end,
  group = autocmd_group,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.md' },
  desc = 'Auto-compile Markdown files after saving',
  callback = function()
    if (not InFolder("Obsidian")) and (not InFolder("README.md")) then
      local raw_file_name = vim.api.nvim_buf_get_name(0)
      local file_name = raw_file_name:gsub('%s', '\\ ')
      local raw_file_pdf = string.sub(raw_file_name, 1, -3) .. "pdf"
      local file_pdf = raw_file_pdf:gsub('%s', '\\ ')
      vim.cmd(string.format(":!pandoc -s %s -o %s --pdf-engine=pdflatex", file_name, file_pdf))
    end
  end,
  group = autocmd_group,
})
