return {
  "Pundima-Lakshan/unified.nvim",
  opts = {
    -- your configuration comes here
  },
  keys = {
    { "<leader>gd", function() require('unified').toggle() end, desc = "Git Unified Diff" },
  }
}
