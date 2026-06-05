-- Rodear texto con comillas/paréntesis/etiquetas fácilmente.
-- Uso el prefijo "gs" para NO chocar con flash (que usa la tecla "s").
--   gsa)  → rodear con ()      (en visual o con un movimiento)
--   gsd)  → quitar el ()
--   gsr)( → cambiar () por (  )
return {
  "echasnovski/mini.surround",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
  },
}
