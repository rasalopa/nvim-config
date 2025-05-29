return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      win = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    })


    local wk_mappings = {
      ["<leader>g"] = {
        name = "Git",
        f = { vim.lsp.buf.format, "Formatear buffer" },
        s = { "<cmd>Telescope git_status<cr>", "Git status" },
        c = { "<cmd>Telescope git_commits<cr>", "Commits repo" },
        b = { "<cmd>Telescope git_branches<cr>", "Ramas git" },
        C = { "<cmd>Telescope git_bcommits<cr>", "Commits buffer" },
      },
      ["<leader>f"] = {
        name = "Archivo",
        f = { "<cmd>Telescope find_files<cr>", "Buscar archivo" },
        g = { "<cmd>Telescope live_grep<cr>", "Buscar texto" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers abiertos" },
        h = { "<cmd>Telescope help_tags<cr>", "Ayuda" },
        o = { "<cmd>Telescope oldfiles<cr>", "Archivos recientes" },
        p = { "<cmd>Telescope git_files<cr>", "Archivos git" },
        k = { "<cmd>Telescope keymaps<cr>", "Ver keymaps" },
        r = { "<cmd>Telescope resume<cr>", "Reanudar búsqueda" },
        m = { "<cmd>MarkdownPreview<cr>", "Vista previa Markdown" },
        M = { "<cmd>MarkdownPreviewStop<cr>", "Cerrar vista Markdown" },
      },
      ["<leader>e"] = {
        name = "Explorador",
        e = { "<cmd>Neotree toggle<cr>", "Neo-tree" },
        o = { "<cmd>Neotree toggle<cr>", "Explorador de archivos" },
      },
      ["<leader>t"] = {
        name = "TODOs",
        t = { "<cmd>TodoTelescope<cr>", "TODOs (Telescope)" },
        l = { "<cmd>TodoLocList<cr>", "TODOs (loclist)" },
        q = { "<cmd>TodoQuickFix<cr>", "TODOs (quickfix)" },
        T = { "<cmd>TodoTrouble<cr>", "TODOs (Trouble)" },
      },
      ["<leader>l"] = {
        name = "LSP",
        r = { vim.lsp.buf.rename, "Renombrar" },
        a = { vim.lsp.buf.code_action, "Acción de código" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Diagnósticos" },
        f = { vim.lsp.buf.format, "Formatear" },
        s = { vim.lsp.buf.signature_help, "Firma" },
        h = { vim.lsp.buf.hover, "Hover" },
        g = { vim.lsp.buf.declaration, "Ir a declaración" },
        i = { vim.lsp.buf.implementation, "Ver implementación" },
        t = { vim.lsp.buf.type_definition, "Tipo de definición" },
        n = { vim.lsp.buf.rename, "Renombrar símbolo" },
      },
      ["<leader>a"] = {
        name = "Laravel",
        a = { "<cmd>Laravel artisan<cr>", "Artisan" },
        r = { "<cmd>Laravel routes<cr>", "Ver rutas" },
        m = { "<cmd>Laravel related<cr>", "Archivos relacionados" },
      },
      ["<leader>q"] = {
        name = "Salir/Buffers",
        q = { "<cmd>q<cr>", "Salir ventana" },
        Q = { "<cmd>qa<cr>", "Salir todo" },
        b = { "<cmd>bd<cr>", "Cerrar buffer" },
      },
      ["<leader>j"] = {
        name = "Salto (Flash)",
        s = { function() require("flash").jump() end, "Saltar a carácter" },
        S = { function() require("flash").treesitter() end, "Saltar por árbol (TS)" },
        r = { function() require("flash").remote() end, "Salto remoto" },
        R = { function() require("flash").treesitter_search() end, "Buscar con TS" },
      },
      ["<leader>sn"] = {
        name = "Noice",
        l = { "<cmd>Noice last<cr>", "Último mensaje" },
        h = { "<cmd>Noice history<cr>", "Historial de mensajes" },
        a = { "<cmd>Noice all<cr>", "Todos los mensajes" },
        d = { "<cmd>Noice dismiss<cr>", "Cerrar mensajes" },
      },
    }

    wk.register(wk_mappings)
  end,

}

--[[
📋 Lista de Keybindings registrados

<leader>f: file
  - f: Buscar archivo
  - g: Buscar texto
  - b: Buffers abiertos
  - h: Ayuda
  - o: Archivos recientes
  - p: Archivos git
  - k: Ver keymaps
  - r: Reanudar búsqueda

<leader>e: explorer
  - e: Neo-tree
  - o: Explorador de archivos

<leader>g: general
  - f: Formatear buffer
  - s: Git status
  - c: Commits repo
  - b: Ramas git
  - C: Commits buffer

<leader>t: todo
  - t: TODOs (Telescope)
  - l: TODOs (loclist)
  - q: TODOs (quickfix)
  - T: TODOs (Trouble)

<leader>a: laravel
  - a: Artisan
  - r: Ver rutas
  - m: Archivos relacionados

<leader>l: lsp
  - r: Renombrar
  - a: Acción de código
  - d: Diagnósticos
  - f: Formatear
  - s: Firma
  - h: Hover

<leader>q: quit/buffer
  - q: Salir ventana
  - Q: Salir todo
  - b: Cerrar buffer

<leader>j: jump (flash.nvim)
  - s: Saltar a carácter
  - S: Saltar por árbol (TS)
  - r: Salto remoto
  - R: Buscar con TS

<leader>sn: Noice
  - l: Último mensaje
  - h: Historial de mensajes
  - a: Todos los mensajes
  - d: Cerrar mensajes

Otros atajos útiles:
  - [t / ]t: Navegar entre TODOs
--]]
