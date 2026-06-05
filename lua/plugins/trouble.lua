-- Trouble v3 — lista de diagnósticos/errores.
-- (Antes usabas comandos "TroubleToggle" que ya NO existen en v3; por eso
--  todos tus atajos <leader>x... daban error. Esto lo deja en sintaxis v3.)
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                  desc = "Diagnósticos (proyecto)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",     desc = "Diagnósticos (este archivo)" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",          desc = "Símbolos" },
    { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "Definiciones / referencias" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                      desc = "Location list" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                       desc = "Quickfix list" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>",                                 desc = "TODOs (Trouble)" },
  },
  opts = {},
}
