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

-- Cierre inteligente (⌘W): cierra el panel; si es el último, la pestaña;
-- si es la última pestaña, el buffer.
function M.smart_close()
  local win_count = #vim.api.nvim_tabpage_list_wins(0)
  if win_count > 1 then
    vim.cmd("close")
  elseif vim.fn.tabpagenr("$") > 1 then
    vim.cmd("tabclose")
  else
    vim.cmd("confirm bdelete")
  end
end

return M
