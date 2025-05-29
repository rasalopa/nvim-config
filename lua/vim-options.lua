vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")

vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.termguicolors = true

vim.opt.signcolumn = "yes"       -- siempre mostrar el margen de signos
vim.opt.scrolloff = 8            -- deja espacio al mover el cursor
vim.opt.linebreak = true         -- no romper palabras al final de línea
vim.opt.cursorline = true        -- resalta la línea actual

-- Opcional: espacio visual adicional alrededor del texto (requiere soporte GUI como Neovide)
vim.opt.guifont = "FiraCode Nerd Font:h14"
vim.opt.linespace = 4

if vim.g.neovide then
  -- Fuente (ya especificada antes)
  vim.opt.guifont = "FiraCode Nerd Font:h14"

  -- Espaciado entre líneas
  vim.opt.linespace = 4

  -- Padding around the window
  vim.g.neovide_padding_top = 15
  vim.g.neovide_padding_bottom = 15
  vim.g.neovide_padding_right = 15
  vim.g.neovide_padding_left = 15

  -- Animaciones del cursor
  -- vim.g.neovide_cursor_vfx_mode = "railgun" -- opciones: "pixiedust", "sonicboom", "torpedo", "ripple", "wireframe"

  -- Confirmar salida
  vim.g.neovide_confirm_quit = true

  -- Portapapeles del sistema
  vim.g.neovide_input_use_logo = true

  -- Blur effect behind the window
  -- vim.g.neovide_opacity = 1.0
  vim.g.neovide_background_color = "#1e1e2e"
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- Animación suave al hacer scroll
  vim.g.neovide_scroll_animation_length = 0.3

  -- Suavizado adicional y configuración de refresco
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_refresh_rate = 60
end
