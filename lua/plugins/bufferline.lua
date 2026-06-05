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
    -- Colores de catppuccin si está disponible
    local ok, cat = pcall(require, "catppuccin.groups.integrations.bufferline")
    if ok then opts.highlights = cat.get() end
    require("bufferline").setup(opts)
  end,
}
