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

  -- LSPConfig: configuración específica de cada servidor
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua y PHP
      lspconfig.lua_ls.setup({})
      lspconfig.intelephense.setup({})
      lspconfig.phpactor.setup({})
      lspconfig.psalm.setup({})

      -- Angular
      lspconfig.angularls.setup({
        cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations",
          "/usr/local/lib/node_modules",
          "--ngProbeLocations",
          "/usr/local/lib/node_modules",
        },
        on_new_config = function(new_config, _)
          local env = vim.fn.environ()
          env["NG_DEBUG"] = "true"
          new_config.cmd_env = env
        end,
      })

      -- HTML / CSS / JSON / YAML
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })
    end,
  },
}
