-- Cambios de git en el margen (+ ~ -), navegar y manejar "hunks".
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(l, r, desc)
        vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc })
      end

      -- Navegar entre cambios
      map("]h", function() gs.nav_hunk("next") end, "Siguiente cambio (git)")
      map("[h", function() gs.nav_hunk("prev") end, "Cambio anterior (git)")

      -- Acciones sobre el cambio bajo el cursor (grupo <leader>h)
      map("<leader>hp", gs.preview_hunk, "Previsualizar cambio")
      map("<leader>hs", gs.stage_hunk,   "Aplicar (stage) cambio")
      map("<leader>hr", gs.reset_hunk,   "Descartar cambio")
      map("<leader>hb", function() gs.blame_line({ full = true }) end, "Quién cambió esta línea")
      map("<leader>hd", gs.diffthis,     "Ver diff del archivo")
    end,
  },
}
