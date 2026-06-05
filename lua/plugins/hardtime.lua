-- ════════════════════════════════════════════════════════════════════════
--  hardtime.nvim  —  "modo disciplina" para aprender los movimientos de Vim
--
--  • Bloquea las flechas (↑↓←→) para que uses h/j/k/l.
--  • Si machacas la misma tecla (jjjjj) te avisa y te sugiere algo mejor
--    (5j, }, G…), creando el hábito de moverte de forma eficiente.
--
--  ¿Te agobia un día? Apágalo al vuelo con  ⌘H  (Mac) / Alt+h (PC)
--  o con  <Espacio>uh , y vuelve a encenderlo igual.
-- ════════════════════════════════════════════════════════════════════════
return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy",
  opts = {
    -- "hint": solo avisa y sugiere (no bloquea el movimiento repetido).
    -- Empezamos suave; cámbialo a "block" cuando quieras mano dura.
    restriction_mode = "hint",
    max_count = 4,        -- a partir de 4 repeticiones de la misma tecla, avisa
    disable_mouse = false, -- el ratón sigue funcionando
    hint = true,          -- muestra la sugerencia ("usa 5j en vez de jjjjj")
    notification = true,
    -- Avisos amables, sin spam
    disabled_keys = {
      ["<Up>"] = { "", "i" },   -- flechas desactivadas en normal/insertar…
      ["<Down>"] = { "", "i" },
      ["<Left>"] = { "", "i" },
      ["<Right>"] = { "", "i" },
    },
  },
  keys = {
    {
      vim.fn.has("mac") == 1 and "<D-h>" or "<M-h>",
      "<cmd>Hardtime toggle<cr>",
      mode = { "n" },
      desc = "Modo disciplina Vim (on/off)",
    },
    { "<leader>uh", "<cmd>Hardtime toggle<cr>", desc = "Modo disciplina Vim (on/off)" },
  },
}
