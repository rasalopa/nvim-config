return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Show dotfiles
          hide_gitignored = true,
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            -- ["<C-n>"] = "reveal", -- Disabled due to invalid action
          },
        },
      },
    })
  end
}
