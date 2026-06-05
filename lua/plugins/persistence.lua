-- Sesiones automáticas: guarda tu workspace al salir y lo restaura después.
-- Esto es lo que hace que Neovim "recuerde" en qué estabas (archivos, paneles).
return {
  "folke/persistence.nvim",
  lazy = false, -- cargar siempre para guardar la sesión al salir
  opts = {},
  keys = {
    { "<leader>ws", function() require("persistence").load() end,             desc = "Restaurar sesión (esta carpeta)" },
    { "<leader>wl", function() require("persistence").load({ last = true }) end, desc = "Restaurar última sesión" },
    { "<leader>wd", function() require("persistence").stop() end,             desc = "No guardar la sesión actual" },
  },
}
