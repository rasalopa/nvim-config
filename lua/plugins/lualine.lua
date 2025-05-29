return {
	"nvim-lualine/lualine.nvim",
	config = function()
		vim.cmd.colorscheme("catppuccin")
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		})
	end,
}
