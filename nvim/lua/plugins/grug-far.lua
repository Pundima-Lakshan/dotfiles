return {
  "MagicDuck/grug-far.nvim",
  opts = {},
  cmd = "GrugFar",
  keys = {
    -- Normal mode: open replace in file
    {
      "<C-r>",
      function()
        require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
      end,
      mode = "n",
      desc = "Replace in file",
    },
    -- Visual mode: open replace in file with selection
    {
      "<C-r>",
      function()
        require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
      end,
      mode = "v",
      desc = "Replace in file (selection)",
    },
    -- Normal mode: open replace in all files
    {
      "<C-S-r>",
      function()
        require("grug-far").open()
      end,
      mode = "n",
      desc = "Replace in all files",
    },
    -- Visual mode: open replace in all files with selection
    {
      "<C-S-r>",
      function()
        require("grug-far").with_visual_selection()
      end,
      mode = "v",
      desc = "Replace in all files (selection)",
    },
  },
}
