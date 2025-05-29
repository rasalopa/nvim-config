vim.cmd [[highlight IblIndent guifg=#3b4261]]

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "InsertEnter",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
      highlight = "IblIndent",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}
