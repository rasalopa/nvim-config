-- ════════════════════════════════════════════════════════════════════════
--  Autocomandos de calidad de vida (autoguardado, formato, etc.)
-- ════════════════════════════════════════════════════════════════════════
local function aug(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Resaltar brevemente lo que copias (feedback visual al hacer yank)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = aug("yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank({ timeout = 200 })
  end,
})

-- Volver a la última posición del cursor al reabrir un archivo
vim.api.nvim_create_autocmd("BufReadPost", {
  group = aug("last_pos"),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lines = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lines then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ── AUTOGUARDADO ────────────────────────────────────────────────────────
-- Guarda al cambiar de archivo o al perder el foco de la ventana.
-- (No guarda en cada tecla, para que no moleste.)
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  group = aug("autosave"),
  callback = function(ev)
    local b = ev.buf
    if vim.bo[b].buftype ~= "" then return end                 -- nada de terminales
    if not vim.bo[b].modifiable or vim.bo[b].readonly then return end
    if not vim.bo[b].modified then return end                  -- sin cambios
    if vim.api.nvim_buf_get_name(b) == "" then return end      -- archivo sin nombre
    vim.api.nvim_buf_call(b, function() vim.cmd("silent! write") end)
  end,
})

-- ── FORMATO AL GUARDAR ──────────────────────────────────────────────────
-- Activado por defecto. Apágalo/enciéndelo con  :FormatToggle
vim.g.autoformat = true
vim.api.nvim_create_autocmd("BufWritePre", {
  group = aug("format"),
  callback = function(ev)
    if not vim.g.autoformat then return end
    for _, c in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
      if c:supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 2000 })
        return
      end
    end
  end,
})
vim.api.nvim_create_user_command("FormatToggle", function()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify("Formato al guardar: " .. (vim.g.autoformat and "ACTIVADO" or "DESACTIVADO"))
end, { desc = "Activar/desactivar el formato al guardar" })
