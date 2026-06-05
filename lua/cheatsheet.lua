-- ════════════════════════════════════════════════════════════════════════
--  Chuleta de atajos en una ventana flotante.
--  Muestra el contenido de SHORTCUTS.md.  Se abre con :Atajos / ⌘/ / <leader>?
-- ════════════════════════════════════════════════════════════════════════
local M = {}

function M.open()
  local path = vim.fn.stdpath("config") .. "/SHORTCUTS.md"
  local lines
  if vim.fn.filereadable(path) == 1 then
    lines = vim.fn.readfile(path)
  else
    lines = { "No se encontró SHORTCUTS.md en " .. path }
  end

  -- Buffer temporal de solo lectura
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].bufhidden = "wipe"

  -- Tamaño y posición (centrado)
  local width  = math.min(84, math.floor(vim.o.columns * 0.9))
  local height = math.min(#lines, math.floor(vim.o.lines * 0.85))
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width    = width,
    height   = height,
    row      = math.floor((vim.o.lines - height) / 2),
    col      = math.floor((vim.o.columns - width) / 2),
    style    = "minimal",
    border   = "rounded",
    title    = " ⌨  Atajos  (q / Esc para cerrar) ",
    title_pos = "center",
  })
  vim.wo[win].cursorline = true
  vim.wo[win].conceallevel = 2

  -- Cerrar con q o Esc
  for _, key in ipairs({ "q", "<Esc>" }) do
    vim.keymap.set("n", key, "<cmd>close<cr>", { buffer = buf, nowait = true, silent = true })
  end
end

return M
