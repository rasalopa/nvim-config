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
    local claude  = Terminal:new({ cmd = "claude", direction = "float", hidden = true })
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

    -- Dentro de cualquier terminal: doble <Esc> para volver a modo normal de Neovim
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { buffer = 0, desc = "Salir de la terminal" })
      end,
    })
  end,
}
