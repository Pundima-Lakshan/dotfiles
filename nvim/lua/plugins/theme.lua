return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Increase intensity for LSP reference highlights (variable occurrences)
          LspReferenceText = { bg = "#4a7a4a", bold = true },
          LspReferenceRead = { bg = "#4a7a4a", bold = true },
          LspReferenceWrite = { bg = "#5a8a5a", bold = true, underline = true },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}
