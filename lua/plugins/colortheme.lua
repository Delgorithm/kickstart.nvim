return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "soft",
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})

		local toggle_theme = function()
			if vim.o.background == "dark" then
				vim.o.background = "light"
			else
				vim.o.background = "dark"
			end
			vim.cmd("colorscheme gruvbox")
		end

		local toggle_transparency = function()
			local current_mode = require("gruvbox").config.transparent_mode
			require("gruvbox").setup({ transparent_mode = not current_mode })
			vim.cmd("colorscheme gruvbox")
		end

		vim.o.background = "light"
		vim.cmd("colorscheme gruvbox")

		vim.keymap.set("n", "<leader>bg", toggle_theme, { noremap = true, silent = true })

		vim.keymap.set(
			"n",
			"<leader>bgs",
			toggle_transparency,
			{ noremap = true, silent = true, desc = "Toggle transparency" }
		)
	end,
}
