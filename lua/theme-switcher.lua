-- ════════════════════════════════════════════════════════════════════════
--  Cambiador de temas en caliente (sin tocar archivos)
--  El tema elegido se guarda y se recuerda entre reinicios.
-- ════════════════════════════════════════════════════════════════════════
local M = {}

-- Archivo donde se recuerda el último tema elegido (portable Mac/PC).
local save_path = vim.fn.stdpath("data") .. "/theme.txt"

-- Tema por defecto si nunca se ha elegido nada.
M.default = "catppuccin"

-- Guarda el nombre del tema en disco.
function M.save(name)
  local f = io.open(save_path, "w")
  if f then
    f:write(name)
    f:close()
  end
end

-- Lee el tema guardado (o el por defecto si no hay nada).
function M.load()
  local f = io.open(save_path, "r")
  if not f then return M.default end
  local name = f:read("*l")
  f:close()
  return (name and name ~= "") and name or M.default
end

-- Aplica un tema. Si `persist` es true, lo recuerda para la próxima vez.
-- Devuelve true si el tema existía.
function M.apply(name, persist)
  local ok = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify("Tema no encontrado: " .. name, vim.log.levels.WARN)
    return false
  end
  if persist then M.save(name) end
  return true
end

-- Aplica el tema recordado. Se llama al arrancar (desde init.lua).
function M.restore()
  M.apply(M.load(), false)
end

-- Selector con vista previa en vivo (usa Telescope).
-- Mueves el cursor y ves el tema al instante; Enter lo fija y lo guarda,
-- Esc lo cancela y restaura el tema que tenías.
--
-- Nota: no usamos `builtin.colorscheme` porque al pasarle nuestro propio
-- `attach_mappings` se rompe su lógica interna de restaurar el tema: cierra
-- el picker de forma diferida (vim.schedule) y revierte al tema original
-- DESPUÉS de que apliquemos el nuevo. Por eso montamos el picker a mano.
function M.pick()
  local ok, pickers = pcall(require, "telescope.pickers")
  if not ok then
    vim.notify("Telescope no está disponible", vim.log.levels.WARN)
    return
  end
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local previewers = require("telescope.previewers")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local before = vim.g.colors_name or M.default
  local themes = vim.fn.getcompletion("", "color")

  -- Previewer en vivo: aplica el tema bajo el cursor a TODO el editor.
  -- (cerramos el panel de preview porque previsualizamos en el editor entero)
  local closed = false
  local previewer = previewers.new({
    preview_fn = function(_, entry, status)
      if not closed then
        closed = true
        pcall(vim.api.nvim_win_close, status.preview_win, true)
        pcall(vim.api.nvim_win_close, status.preview_border_win, true)
      end
      pcall(vim.cmd.colorscheme, entry.value)
    end,
  })

  -- Si sales sin elegir (Esc), restauramos el tema original.
  local need_restore = true

  local picker = pickers.new({}, {
    prompt_title = "Cambiar tema",
    finder = finders.new_table({ results = themes }),
    sorter = conf.generic_sorter({}),
    previewer = previewer,
    attach_mappings = function(prompt_bufnr)
      -- Enter: fija y guarda el tema seleccionado.
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        need_restore = false
        actions.close(prompt_bufnr)
        -- vim.schedule para ejecutarse DESPUÉS del cierre diferido de Telescope.
        vim.schedule(function()
          M.apply(entry and entry.value or before, true)
        end)
      end)
      return true
    end,
  })

  -- Al cerrar el picker sin elegir, devuelve el tema que tenías.
  local close_windows = picker.close_windows
  picker.close_windows = function(status)
    close_windows(status)
    if need_restore then
      vim.schedule(function()
        M.apply(before, false)
      end)
    end
  end

  picker:find()
end

return M
