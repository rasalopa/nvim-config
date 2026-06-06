return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      -- Cierra neo-tree al abrir un archivo (ponlo en true si lo prefieres)
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      enable_cursorline = true, -- resalta la línea donde estás

      -- ── Aspecto general de cada línea del árbol ──
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- sangría extra al inicio de cada línea (respira mejor)
          -- Guías de árbol: líneas que conectan carpetas con su contenido
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- Flechas de expandir / colapsar carpetas
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          default = "",
        },
        modified = {
          symbol = "●", -- punto en buffers con cambios sin guardar
        },
        -- ── Estado git con símbolos e iconos propios (con color) ──
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },

      filesystem = {
        filtered_items = {
          visible = true, -- Mostrar dotfiles
          hide_gitignored = true,
        },
        -- Resalta automáticamente el archivo que tienes abierto
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        use_libuv_file_watcher = true, -- refresca solo al cambiar archivos en disco
        window = {
          position = "left",
          width = 38,
          -- Si un nombre/ruta no cabe, el panel se ensancha solo y luego vuelve.
          -- Pulsa "e" dentro del explorador para activarlo/desactivarlo a mano.
          auto_expand_width = true,
          mappings = {
            -- ["<C-n>"] = "reveal", -- Disabled due to invalid action
          },
        },
      },
    })
  end,
}
