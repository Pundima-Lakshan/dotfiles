
return {
  "folke/tokyonight.nvim",
  opts = {
    on_highlights = function(highlights, colors)
      highlights.LineNr.fg = colors.fg
      highlights.LineNrAbove.fg = colors.fg
      highlights.LineNrBelow.fg = colors.fg
    end,
  },
}
