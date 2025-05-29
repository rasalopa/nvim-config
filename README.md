# 🛠️ Configuración de Neovim personalizada por rasalopa

Este repositorio contiene mi configuración de Neovim, optimizada para desarrollo backend/frontend con soporte para LSP, autocompletado, depuración, temas visuales modernos y mejoras de experiencia de usuario.

---

## 📦 Plugins utilizados

Los siguientes plugins fueron instalados usando [lazy.nvim](https://github.com/folke/lazy.nvim):

### Lenguajes y LSP
- `nvim-lspconfig`: Configuración base para LSPs.
- `mason.nvim` + `mason-lspconfig.nvim`: Instalación y gestión automática de servidores LSP.
- `typescript-tools.nvim`: Soporte extendido para TypeScript.
- `none-ls.nvim`: Linter/formatter unificado vía Null-LS.
- `nvim-dap`: Depuración de código con soporte para adapters.

### UI y Experiencia
- `catppuccin.nvim`: Tema visual moderno (actualmente `catppuccin-mocha`).
- `lualine.nvim`: Barra de estado.
- `noice.nvim`: UI para mensajes de Neovim.
- `alpha-nvim`: Dashboard inicial con arte ASCII personalizado.
- `which-key.nvim`: Ayuda visual para atajos de teclado.
- `flash.nvim`: Mejora de navegación por texto.
- `telescope.nvim`: Fuzzy finder para archivos, buffers, comandos, etc.

### Productividad
- `nvim-cmp`: Autocompletado inteligente.
- `LuaSnip`: Snippets.
- `todo-comments.nvim`: Gestión de comentarios tipo TODO/FIX/NOTE/etc.
- `markdown-preview.nvim`: Vista previa de archivos Markdown.

---

## 🧩 Keybindings importantes

Estos están gestionados con `which-key.nvim`. Algunos de los principales:

| Atajo         | Acción                       |
|---------------|------------------------------|
| `<leader>ff`  | Buscar archivos (Telescope)  |
| `<leader>fb`  | Buffers abiertos             |
| `<leader>gg`  | Git (lazygit)                |
| `<leader>dc`  | Iniciar depuración           |
| `<leader>td`  | Ver todos los TODO comments  |
| `s`           | Flash jump                   |

---

## 🖥️ UI Personalizada con Neovide

Neovide es una GUI para Neovim que permite personalizaciones visuales adicionales:

```lua
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 10
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10