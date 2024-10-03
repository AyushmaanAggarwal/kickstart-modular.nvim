local autocmd_group = vim.api.nvim_create_augroup('Custom auto-commands', { clear = true })

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
    local raw_file_name = vim.api.nvim_buf_get_name(0)
    local file_name = raw_file_name:gsub('%s', '\\ ')
    local raw_file_pdf = string.sub(raw_file_name, 1, -3) .. "pdf"
    local file_pdf = raw_file_pdf:gsub('%s', '\\ ')
    vim.print(file_pdf)
    vim.cmd(string.format(":silent !nohup pandoc -s %s -o %s --pdf-engine=pdflatex", file_name, file_pdf))
  end,
  group = autocmd_group,
})
