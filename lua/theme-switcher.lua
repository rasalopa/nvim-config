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
-- Mueves el cursor y ves el tema al instante; Enter lo fija y lo guarda.
function M.pick()
  local ok, builtin = pcall(require, "telescope.builtin")
  if not ok then
    vim.notify("Telescope no está disponible", vim.log.levels.WARN)
    return
  end
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  builtin.colorscheme({
    enable_preview = true,
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if entry then
          M.apply(entry.value, true)
        end
      end)
      return true
    end,
  })
end

return M
