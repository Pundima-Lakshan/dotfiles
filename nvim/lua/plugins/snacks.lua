return {
	"folke/snacks.nvim",
	opts = {
		scroll = {
			enabled = true,
		},
	},
  keys = {
    { "<leader>gd", false },
    { "<leader>gD", function() Snacks.picker.git_diff() end, desc = "Git Diff (hunks)" },
  }
}
