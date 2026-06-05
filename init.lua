-- Python host (opcional): solo se activa si existe el venv. Portable Mac/PC.
local py = vim.fn.has("win32") == 1
    and vim.fn.expand("~/.venvs/nvim/Scripts/python.exe")
    or vim.fn.expand("~/.venvs/nvim/bin/python")
if vim.fn.filereadable(py) == 1 then
  vim.g.python3_host_prog = py
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins", {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_theme = "dark"
    end,
  },
  rocks = {
    enabled = false,
    hererocks = false,
  },
})

-- Aplica el tema recordado (o catppuccin por defecto). Ver lua/theme-switcher.lua
require("theme-switcher").restore()

-- Atajos estilo Terax (⌘ en Mac / Alt en PC). Ver lua/terax-keys.lua
require("terax-keys")

-- Autocomandos de calidad de vida (autoguardado, formato al guardar, etc.)
require("autocmds")
