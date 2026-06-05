return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- theme = "auto" hace que la barra siga al tema activo, sea cual sea.
		local opts = {
			options = {
				theme = "auto",
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		}
		require("lualine").setup(opts)

		-- Al cambiar de tema, rehacemos el setup para que "auto" recalcule
		-- los colores de la barra de estado.
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("user_lualine_theme", { clear = true }),
			callback = function()
				require("lualine").setup(opts)
			end,
		})
	end,
}
