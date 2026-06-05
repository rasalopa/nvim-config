return {

  -- Mason: instalación de LSPs
  {
    "williamboman/mason.nvim",
    version = "v1.8.3",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig: integración con lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    version = "v1.26.0",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "intelephense",
          "phpactor",
          "psalm",
          "angularls",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
        },
        automatic_installation = false,
      })
    end,
  },

  -- LSPConfig: configuración específica de cada servidor (API nativa de Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Angular: cmd y entorno personalizados
      vim.lsp.config("angularls", {
        cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations",
          "/usr/local/lib/node_modules",
          "--ngProbeLocations",
          "/usr/local/lib/node_modules",
        },
        cmd_env = vim.tbl_extend("force", vim.fn.environ(), { NG_DEBUG = "true" }),
      })

      -- YAML: desactivar ordenado de claves
      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })

      -- Activar todos los servidores
      vim.lsp.enable({
        "lua_ls",
        "intelephense",
        "phpactor",
        "psalm",
        "angularls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
      })
    end,
  },
}
