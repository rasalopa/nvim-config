return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-neotest/nvim-nio",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  -- Atajos en <leader>a (antes estaban en <leader>l y chocaban con LSP)
  keys = {
    { "<leader>aa", "<cmd>Laravel artisan<cr>", desc = "Artisan" },
    { "<leader>ar", "<cmd>Laravel routes<cr>",  desc = "Ver rutas" },
    { "<leader>am", "<cmd>Laravel related<cr>", desc = "Archivos relacionados" },
  },
  event = { "VeryLazy" },
  opts = {},
  config = true,
}
