-- ════════════════════════════════════════════════════════════════════════
--  Temas extra disponibles para el selector (<leader>ut)
--  Catppuccin tiene su propio archivo (catppuccin.lua); aquí van el resto.
--  Todos se cargan al arranque para poder previsualizarlos al instante.
-- ════════════════════════════════════════════════════════════════════════
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" }, -- variantes: night, storm, moon, day (claro)
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },
}
