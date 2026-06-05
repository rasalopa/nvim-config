return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Cabecera
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Subtítulo: saludo según la hora + fecha
    local function greeting()
      local hour = tonumber(os.date("%H"))
      local saludo
      if hour < 6 then
        saludo = "Buenas noches"
      elseif hour < 12 then
        saludo = "Buenos días"
      elseif hour < 20 then
        saludo = "Buenas tardes"
      else
        saludo = "Buenas noches"
      end
      local user = os.getenv("USER") or os.getenv("USERNAME") or "dev"
      return string.format("  %s, %s  ·  %s", saludo, user, os.date("%A %d %B %Y"))
    end

    -- Info de Git del directorio actual (rama + nº de cambios)
    local function git_info()
      if vim.fn.executable("git") == 0 then
        return nil
      end
      local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
      if not branch or branch == "" or vim.v.shell_error ~= 0 then
        return nil
      end
      local changes = vim.fn.systemlist("git status --porcelain 2>/dev/null")
      local n = #changes
      if n > 0 then
        return string.format("   %s  ·  %d cambio%s", branch, n, n == 1 and "" or "s")
      end
      return string.format("   %s  ·  limpio", branch)
    end

    -- Menú
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("b", "  > Toggle file explorer", "<cmd>Neotree toggle<CR>"),
      dashboard.button("f", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("c", "  Claude (IA)", "<cmd>ClaudeToggle<CR>"),
      dashboard.button("s", "  Restaurar sesión anterior", "<cmd>lua require('persistence').load()<CR>"),
      dashboard.button("V", "  Practicar Vim (juego)", "<cmd>VimBeGood<CR>"),
      dashboard.button("T", "  Tutorial de Vim", "<cmd>Tutor<CR>"),
      dashboard.button("C", "  Editar config", "<cmd>lua require('telescope.builtin').find_files({cwd=vim.fn.stdpath('config')})<CR>"),
      dashboard.button("L", "󰒲  Lazy (plugins)", "<cmd>Lazy<CR>"),
      dashboard.button("M", "  Mason (LSP/tools)", "<cmd>Mason<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Tip de movimiento del día (rota solo, uno por día del año)
    local tips = {
      "w / b  →  salta una palabra adelante / atrás",
      "0 / $  →  ve al principio / final de la línea",
      "gg / G  →  ve al inicio / final del archivo",
      "{ / }  →  salta de párrafo en párrafo",
      "Ctrl+d / Ctrl+u  →  baja / sube media pantalla",
      "f + letra  →  salta a la siguiente <letra> de la línea (; repite)",
      "dd  →  borra la línea entera   ·   yy  →  cópiala",
      "ciw  →  cambia la palabra bajo el cursor (cambiar-interior-palabra)",
      "5j / 10k  →  baja 5 / sube 10 líneas de golpe (en vez de machacar)",
      "% sobre un ( { [  →  salta a su pareja de cierre",
      "* sobre una palabra  →  busca la siguiente igual",
      "/texto  →  busca · n / N  →  siguiente / anterior coincidencia",
      "o / O  →  abre línea nueva debajo / encima y entra a escribir",
      "A  →  ir al final de la línea y escribir   ·   I  →  al principio",
      "diw · da\"  →  borra palabra · borra lo que hay entre comillas",
      "u  →  deshacer   ·   Ctrl+r  →  rehacer",
      ". (punto)  →  repite tu última edición",
      "s  →  salto flash: pulsa s + 2 letras y vuela a cualquier sitio visible",
      "V  →  selecciona líneas enteras   ·   Ctrl+v  →  selección en bloque",
      ">> / <<  →  indenta la línea a la derecha / izquierda",
    }
    local idx = (tonumber(os.date("%j")) % #tips) + 1
    dashboard.section.tip = {
      type = "text",
      val = "  💡 Truco del día:  " .. tips[idx],
      opts = { position = "center", hl = "Comment" },
    }

    -- Pie: saludo + git + estadísticas (plugins + tiempo de arranque)
    local function footer()
      local lines = { greeting() }
      local git = git_info()
      if git then
        table.insert(lines, git)
      end
      local ok, lazy = pcall(require, "lazy")
      if ok then
        local stats = lazy.stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        table.insert(lines, "")
        table.insert(lines, string.format("  %d plugins cargados en %s ms", stats.loaded, ms))
      end
      return lines
    end

    -- Insertar el truco del día entre el menú y el pie
    table.insert(dashboard.opts.layout, { type = "padding", val = 1 })
    table.insert(dashboard.opts.layout, dashboard.section.tip)

    alpha.setup(dashboard.opts)

    -- Refrescar el pie cuando lazy termina de cargar (stats reales)
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- Pie inicial (las stats llegan tras LazyVimStarted)
    dashboard.section.footer.val = footer()

    -- Sin folding en el buffer de alpha
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
