-- ════════════════════════════════════════════════════════════════════════
--  Utilidades para los atajos estilo Terax
-- ════════════════════════════════════════════════════════════════════════
local M = {}

-- Zoom: cambia el tamaño de la fuente en Neovide (⌘= / ⌘-)
function M.zoom(delta)
  local cur = vim.g.neovide_scale_factor or 1.0
  vim.g.neovide_scale_factor = math.max(0.5, math.min(3.0, cur + delta))
end

function M.zoom_reset()
  vim.g.neovide_scale_factor = 1.0
end

-- Cierre inteligente (⌘W):
--   • en una terminal / panel especial → cierra ese panel
--   • en un archivo normal → cierra el archivo (su pestaña), conservando el panel
function M.smart_close()
  if vim.bo.buftype ~= "" then
    vim.cmd("close")
  else
    vim.cmd("confirm bdelete")
  end
end

return M
