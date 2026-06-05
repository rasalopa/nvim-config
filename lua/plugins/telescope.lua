return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    cmd = "Telescope",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "folke/todo-comments.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- Build portable: `make` en Mac/Linux, `cmake` en Windows.
        build = vim.fn.has("win32") == 1
            and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            or "make",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      -- pcall: si fzf-native no llegó a compilar (p.ej. Windows sin cmake),
      -- Telescope sigue funcionando igual, solo un poco más lento al ordenar.
      pcall(telescope.load_extension, "fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
    end,
    keys = {
      -- Buscar (<leader>f...)
      { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Buscar archivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Buscar texto" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers abiertos" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Archivos recientes" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Ayuda de Neovim" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",     desc = "Ver atajos" },
      -- Cambiar de tema con vista previa en vivo (y se recuerda al reiniciar)
      { "<leader>ut", function() require("theme-switcher").pick() end, desc = "Cambiar tema (vista previa)" },
      { "<leader>fp", "<cmd>Telescope git_files<cr>",   desc = "Archivos del repo git" },
      {
        "<leader>fe",
        function()
          require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
        end,
        desc = "Explorador de archivos (browser)",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({ prompt_title = "Config de Neovim", cwd = vim.fn.stdpath("config") })
        end,
        desc = "Editar config de Neovim",
      },
      -- Git (<leader>g...)
      { "<leader>gs", "<cmd>Telescope git_status<cr>",   desc = "Git status" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>",  desc = "Commits del repo" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Ramas" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Commits de este archivo" },
    },
  },
}
