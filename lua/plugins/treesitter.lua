return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "php",
        "php_only",
        "phpdoc",
        "javascript",
        "bash",
        "css",
        "html",
        "json",
        "sql",
        "typescript",
        "vue",
        "git_config",
        "gitcommit",
        "gitignore"
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ignore_install = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
  })
  end
}
