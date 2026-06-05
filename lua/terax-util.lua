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

-- Explorador inteligente (⌘B):
--   • Cerrado            → lo abre y te lleva el foco
--   • Abierto, sin foco  → te lleva el foco al explorador (no lo cierra)
--   • Abierto, con foco  → lo oculta
function M.smart_explorer()
  -- ¿Estás ahora mismo dentro del explorador?
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("Neotree close")
    return
  end
  -- ¿Hay alguna ventana de neo-tree abierta?
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "neo-tree" then
      vim.cmd("Neotree focus")
      return
    end
  end
  -- No está abierto → ábrelo con el foco dentro
  vim.cmd("Neotree focus")
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
