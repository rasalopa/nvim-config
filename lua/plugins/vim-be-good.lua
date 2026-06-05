-- ════════════════════════════════════════════════════════════════════════
--  vim-be-good  —  minijuego para practicar los movimientos de Vim
--
--  Ábrelo con  :VimBeGood  (o el botón "Practicar Vim" del inicio).
--  Elige un juego de la lista y practica 5 minutos: te da objetivos y mide
--  tu velocidad. Ideal para calentar antes de empezar a programar.
-- ════════════════════════════════════════════════════════════════════════
return {
  "ThePrimeagen/vim-be-good",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "VimBeGood",
}
