return {
  "pmizio/typescript-tools.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local on_attach = function(client, bufnr)
      local buf_map = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
      end

      buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
      buf_map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      buf_map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
      buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    end

    require("typescript-tools").setup({
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = "all",
        tsserver_plugins = {},
        complete_function_calls = true,
        tsserver_max_memory = 4096,
        on_attach = on_attach,
      },
    })
  end,
}
