-- Pestañas visuales de los archivos abiertos (arriba), como un IDE.
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      separator_style = "thin",
      offsets = {
        { filetype = "neo-tree", text = "Explorador", highlight = "Directory", separator = true },
      },
    },
  },
  config = function(_, opts)
    -- Aplica los colores adecuados a las pestañas según el tema activo:
    -- integración especial de catppuccin si está activo, colores del propio
    -- tema en cualquier otro caso.
    local function aplicar_colores()
      if (vim.g.colors_name or ""):match("^catppuccin") then
        local ok, cat = pcall(require, "catppuccin.groups.integrations.bufferline")
        opts.highlights = ok and cat.get() or nil
      else
        opts.highlights = nil
      end
      require("bufferline").setup(opts)
    end

    aplicar_colores()

    -- Al cambiar de tema, recoloreamos las pestañas.
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("user_bufferline_theme", { clear = true }),
      callback = aplicar_colores,
    })
  end,
}
