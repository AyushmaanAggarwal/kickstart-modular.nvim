return {
  'lervag/vimtex',
  init = function()
    -- Use init for configuration, don't use the more common "config".
    -- Setting up vimtex configurations
    -- vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_view_general_viewer = 'org.kde.okular'
    vim.g.vimtex_complier_method = 'luatex'
    vim.g.vimtex_compiler_latexmk = { out_dir = './output', options = { '--shell-escape' } }
    -- vim.g.vimtex_compiler_latexmk_engines = {'lualatex (shell-escape)' : '-lualatex -shell-escape'}
  end,
}
