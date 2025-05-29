return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "folke/todo-comments.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,              -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
    config = function(opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
    end,
    keys = {
      {
        "<leader>km",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "@ Telescope Keymaps",
      },
      {
        "<leader>of",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "@ Telescope Old files",
      },
      {
        "<leader>lg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "@ Telescope Live grep",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "@ Telescope Find Files",
      },
      {
        "<leader>pp",
        function()
          require("telescope.builtin").git_files({ show_untracked = true })
        end,
        desc = "@ Telescope Git Files",
      },
      {
        "<leader>pe",
        function()
          require("telescope.builtin").git_commits()
        end,
        desc = "@ Telescope Git commits",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "@ Telescope Git status",
      },
      {
        "<leader>gc",
        function()
          require("telescope.builtin").git_bcommits()
        end,
        desc = "@ Telescope Git B commits. Commits related with actual branch",
      },
      {
        "<leader>gb",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "@ Telescope Git branches",
      },
      {
        "<leader>rp",
        function()
          require("telescope.builtin").find_files({
            prompt_title = "Plugins",
            cwd = vim.fn.stdpath("config") .. "/lua/plugins",
            attach_mappings = function(_, map)
              local actions = require("telescope.actions")
              local action_state = require("telescope.actions.state")
              map("i", "<c-y>", function(prompt_bufnr)
                local new_plugin = action_state.get_current_line()
                actions.close(prompt_bufnr)
                vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
              end)
              return true
            end,
          })
        end,
      },
      {
        "<leader>bb",
        function()
          require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
        end,
        desc = "@ Telescope file browser",
      },
    },
  },
}
