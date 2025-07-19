return {
  {
    "3rd/image.nvim",
    dependencies = {
          {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
              require("nvim-treesitter.configs").setup({
                ensure_installed = { "markdown" },
                highlight = { enable = true }})
            end,
          },
        },
        opts = {
          processor = "magick_rock",
          backend = "kitty",
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              floating_windows = true,
              filetypes = { "markdown", "vimwiki", "quarto" },
            },
            neorg = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              filetypes = { "norg" },
            },
            html = {
              enabled = true,
            },
            css = {
              enabled = true,
            },
          },
          max_width = nil,
          max_height = nil,
          max_width_window_percentage = 75,
          max_height_window_percentage = 50,
          kitty_method = "normal",
          hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
        },
      },
}
