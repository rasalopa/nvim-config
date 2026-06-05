-- ════════════════════════════════════════════════════════════════════════
--  toggleterm.nvim  —  terminales integradas (Claude, lazygit, SSH, shell)
--  Esto es lo que convierte Neovim en un "workspace" tipo Terax.
-- ════════════════════════════════════════════════════════════════════════
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec", "ClaudeToggle", "FloatTerm", "LazygitToggle", "Ssh" },
  keys = {
    -- Atajos de respaldo con <leader> (funcionan también en terminal pura)
    { "<leader>cc", "<cmd>ClaudeToggle<cr>",  desc = "Claude (IA)" },
    { "<leader>cf", "<cmd>FloatTerm<cr>",     desc = "Terminal flotante" },
    { "<leader>cg", "<cmd>LazygitToggle<cr>", desc = "Lazygit" },
    { "<leader>cs", ":Ssh ",                  desc = "SSH a un host" },
  },
  opts = {
    direction = "float",
    shade_terminals = true,
    size = function(term)
      if term.direction == "vertical" then return math.floor(vim.o.columns * 0.42) end
      return 20
    end,
    float_opts = {
      border = "curved",
      width  = function() return math.floor(vim.o.columns * 0.85) end,
      height = function() return math.floor(vim.o.lines * 0.85) end,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    local Terminal = require("toggleterm.terminal").Terminal

    -- Terminales dedicadas (persistentes, ocultas hasta que las invocas)
    local claude  = Terminal:new({ cmd = "claude", direction = "vertical", hidden = true })
    local float   = Terminal:new({ direction = "float", hidden = true })
    local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

    vim.api.nvim_create_user_command("ClaudeToggle", function() claude:toggle() end, {})
    vim.api.nvim_create_user_command("FloatTerm",    function() float:toggle() end, {})

    vim.api.nvim_create_user_command("LazygitToggle", function()
      if vim.fn.executable("lazygit") == 0 then
        vim.notify("lazygit no está instalado.\nInstálalo con:  brew install lazygit", vim.log.levels.WARN)
        return
      end
      lazygit:toggle()
    end, {})

    -- :Ssh host   ó   :Ssh   (te pregunta el host) → abre la sesión en una pestaña
    vim.api.nvim_create_user_command("Ssh", function(o)
      local host = (o.args ~= "" and o.args) or vim.fn.input("SSH host (user@servidor): ")
      if host == "" then return end
      Terminal:new({ cmd = "ssh " .. host, direction = "tab", close_on_exit = false }):toggle()
    end, { nargs = "?" })

    -- Dentro de cualquier terminal: doble <Esc> (rápido) cierra/oculta la terminal
    -- y te devuelve al editor. El proceso sigue vivo: lo reabres con ⌘R / ⌘I / ⌘G.
    local function cerrar_terminal()
      vim.cmd("stopinsert") -- salir del modo escritura de la terminal
      local id = vim.b.toggle_number -- id que toggleterm pone en el buffer
      local cerrada = false
      if id then
        pcall(function()
          local term = require("toggleterm.terminal").get(id, true)
          if term then term:close() end -- cierre "oficial" (estado consistente)
          cerrada = true
        end)
      end
      if not cerrada then vim.cmd("silent! close") end -- respaldo
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function(ev)
        vim.keymap.set("t", "<Esc><Esc>", cerrar_terminal,
          { buffer = ev.buf, desc = "Cerrar / ocultar la terminal" })
      end,
    })
  end,
}
