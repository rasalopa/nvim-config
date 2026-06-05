-- which-key v3 — menú de ayuda de atajos.
-- (Migrado del formato viejo wk.register({...}), que estaba deprecado, al
--  formato nuevo con `spec`. Aquí solo defino: los NOMBRES de los grupos y
--  los atajos de LSP / salir / explorador, que no define ningún otro plugin.
--  El resto de atajos vive en cada plugin: telescope.lua, trouble.lua, etc.)
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    win = { border = "rounded" },
    spec = {
      -- Nombres de los grupos (lo que ves al pulsar <leader>)
      { "<leader>f", group = "Buscar" },
      { "<leader>g", group = "Git" },
      { "<leader>e", group = "Explorador" },
      { "<leader>l", group = "LSP" },
      { "<leader>a", group = "Laravel" },
      { "<leader>t", group = "TODOs" },
      { "<leader>x", group = "Diagnósticos" },
      { "<leader>c", group = "Claude / Terminal" },
      { "<leader>w", group = "Workspace / sesión" },
      { "<leader>u", group = "Interfaz / temas" },
      { "<leader>h", group = "Git: cambios (hunks)" },
      { "<leader>q", group = "Salir" },
      { "<leader>sn", group = "Noice (mensajes)" },

      -- LSP (acciones sobre el código)
      { "<leader>lr", vim.lsp.buf.rename,                       desc = "Renombrar símbolo" },
      { "<leader>la", vim.lsp.buf.code_action,                  desc = "Acción de código" },
      { "<leader>lh", vim.lsp.buf.hover,                        desc = "Ver info (hover)" },
      { "<leader>ls", vim.lsp.buf.signature_help,               desc = "Firma de función" },
      { "<leader>li", vim.lsp.buf.implementation,               desc = "Ir a implementación" },
      { "<leader>lt", vim.lsp.buf.type_definition,              desc = "Ir al tipo" },
      { "<leader>lD", vim.lsp.buf.declaration,                  desc = "Ir a declaración" },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Ver diagnósticos" },
      { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, desc = "Formatear archivo" },

      -- Salir / buffers
      { "<leader>qq", "<cmd>q<cr>",  desc = "Cerrar ventana" },
      { "<leader>qQ", "<cmd>qa<cr>", desc = "Salir de todo" },
      { "<leader>qb", "<cmd>bd<cr>", desc = "Cerrar buffer" },

      -- Explorador (el resto lo maneja neo-tree con <D-b>/Alt+b)
      { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Explorador (abrir/cerrar)" },
      { "<leader>ef", "<cmd>Neotree focus<cr>",  desc = "Foco en explorador" },
    },
  },
}
