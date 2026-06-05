-- ════════════════════════════════════════════════════════════════════════
--  ATAJOS ESTILO TERAX  —  multiplataforma (Mac y PC)
--
--  El modificador se elige solo según el sistema operativo:
--     • macOS          →  ⌘ (Cmd)      ej. ⌘T, ⌘B, ⌘I
--     • Windows / Linux →  Alt          ej. Alt+T, Alt+B, Alt+I
--
--  ¿Por qué Alt en PC y no Ctrl? Porque Ctrl está reservado por Vim
--  (Ctrl+W, Ctrl+V, Ctrl+R…) y la tecla Win la usa el sistema. Alt es la
--  única que da el "feel" de atajo moderno sin romper nada.
--
--  En Mac, los ⌘ solo funcionan dentro de Neovide (la GUI). En cualquier
--  caso siempre tienes la capa universal con <leader> (barra espaciadora).
-- ════════════════════════════════════════════════════════════════════════

local map  = vim.keymap.set
local util = require("terax-util")

-- Modificador según el SO:  D = Cmd (mac)   |   M = Alt (Windows/Linux)
local mod = vim.fn.has("mac") == 1 and "D" or "M"
local function mk(key) return "<" .. mod .. "-" .. key .. ">" end
local function ms(key) return "<" .. mod .. "-S-" .. key .. ">" end

local nvi = { "n", "v", "i" }
local nv  = { "n", "v" }
local nt  = { "n", "t" }
local nti = { "n", "t", "i" }

-- ── GENERAL ─────────────────────────────────────────────────────────────
map("n", mk(","), "<cmd>edit $MYVIMRC<cr>", { desc = "Abrir config" })
map(nv,  mk("k"), "<cmd>WhichKey<cr>",      { desc = "Ver atajos" })
map("n", mk("q"), "<cmd>confirm qall<cr>",  { desc = "Salir" })

-- ── PESTAÑAS (Tabs) ─────────────────────────────────────────────────────
map(nvi, mk("t"),     "<cmd>tabnew<cr>",                 { desc = "Pestaña nueva" })
map(nvi, mk("e"),     "<cmd>enew<cr>",                   { desc = "Archivo nuevo" })
map("n", mk("w"),     function() util.smart_close() end, { desc = "Cerrar panel/pestaña" })
map(nti, "<C-Tab>",   "<cmd>tabnext<cr>",                { desc = "Pestaña siguiente" })
map(nti, "<C-S-Tab>", "<cmd>tabprevious<cr>",            { desc = "Pestaña anterior" })
for i = 1, 9 do
  map(nvi, mk(tostring(i)), i .. "gt", { desc = "Ir a pestaña " .. i })
end

-- ── PANELES (Splits) ────────────────────────────────────────────────────
map("n", mk("d"), "<cmd>vsplit<cr>", { desc = "Dividir panel → derecha" })
map("n", ms("d"), "<cmd>split<cr>",  { desc = "Dividir panel ↓ abajo" })
map(nt,  mk("]"), "<C-w>w",          { desc = "Foco panel siguiente" })
map(nt,  mk("["), "<C-w>W",          { desc = "Foco panel anterior" })

-- ── GIT (source panel) ──────────────────────────────────────────────────
map(nt, mk("g"), "<cmd>LazygitToggle<cr>", { desc = "Git (lazygit)" })

-- ── VISTA (View) ────────────────────────────────────────────────────────
map(nvi, mk("b"), "<cmd>Neotree toggle<cr>",        { desc = "Explorador de archivos" })
map(nvi, ms("e"), "<cmd>Neotree focus<cr>",         { desc = "Foco en explorador" })
map(nv,  mk("="), function() util.zoom(0.1) end,    { desc = "Zoom +" })
map(nv,  mk("-"), function() util.zoom(-0.1) end,   { desc = "Zoom -" })
map(nv,  mk("0"), function() util.zoom_reset() end, { desc = "Zoom reset" })

-- ── BÚSQUEDA (Search) ───────────────────────────────────────────────────
map("n", mk("p"), "<cmd>Telescope find_files<cr>",                { desc = "Abrir archivo (quick open)" })
map("n", ms("f"), "<cmd>Telescope live_grep<cr>",                 { desc = "Buscar texto en el proyecto" })
map("n", mk("f"), "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buscar en el archivo actual" })

-- ── IA / TERMINAL (Claude) ──────────────────────────────────────────────
map(nti, mk("i"), "<cmd>ClaudeToggle<cr>", { desc = "Claude (IA)" })
map(nti, mk("r"), "<cmd>FloatTerm<cr>",    { desc = "Terminal flotante" })

-- ── EDITOR ──────────────────────────────────────────────────────────────
map("n", mk("z"), "u",          { desc = "Deshacer" })
map("i", mk("z"), "<C-o>u",     { desc = "Deshacer" })
map("n", ms("z"), "<C-r>",      { desc = "Rehacer" })
map("n", mk("y"), "<C-r>",      { desc = "Rehacer" })
map(nvi, mk("s"), "<cmd>w<cr>", { desc = "Guardar" })

-- ── PORTAPAPELES (Clipboard) ────────────────────────────────────────────
map("n", mk("c"), '"+yy',             { desc = "Copiar línea" })
map("v", mk("c"), '"+y',              { desc = "Copiar" })
map("v", mk("x"), '"+d',              { desc = "Cortar" })
map("n", mk("v"), '"+p',              { desc = "Pegar" })
map("v", mk("v"), '"+p',              { desc = "Pegar" })
map("i", mk("v"), "<C-r><C-o>+",      { desc = "Pegar" })
map("c", mk("v"), "<C-r>+",           { desc = "Pegar" })
map("t", mk("v"), [[<C-\><C-n>"+pi]], { desc = "Pegar (terminal)" })
map("n", mk("a"), "ggVG",             { desc = "Seleccionar todo" })

-- ── CHULETA DE ATAJOS ───────────────────────────────────────────────────
vim.api.nvim_create_user_command("Atajos", function()
  require("cheatsheet").open()
end, { desc = "Mostrar la chuleta de atajos" })
map("n", mk("/"),     "<cmd>Atajos<cr>", { desc = "Ver chuleta de atajos" })
map("n", "<leader>?", "<cmd>Atajos<cr>", { desc = "Ver chuleta de atajos" })
