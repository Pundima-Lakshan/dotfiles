-- Helper function to make a highlight group transparent while preserving other attributes
local function make_transparent(group)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  hl.bg = nil
  vim.api.nvim_set_hl(0, group, hl)
end

-- transparent background
make_transparent("Normal")
make_transparent("NormalFloat")
make_transparent("FloatBorder")
make_transparent("Pmenu")
make_transparent("Terminal")
make_transparent("EndOfBuffer")
make_transparent("FoldColumn")
make_transparent("Folded")
make_transparent("SignColumn")
make_transparent("NormalNC")
make_transparent("WhichKeyFloat")
make_transparent("TelescopeBorder")
make_transparent("TelescopeNormal")
make_transparent("TelescopePromptBorder")
make_transparent("TelescopePromptTitle")

-- transparent background for neotree
make_transparent("NeoTreeNormal")
make_transparent("NeoTreeNormalNC")
make_transparent("NeoTreeVertSplit")
make_transparent("NeoTreeWinSeparator")
make_transparent("NeoTreeEndOfBuffer")

-- transparent background for nvim-tree
make_transparent("NvimTreeNormal")
make_transparent("NvimTreeVertSplit")
make_transparent("NvimTreeEndOfBuffer")

-- transparent notify background
make_transparent("NotifyINFOBody")
make_transparent("NotifyERRORBody")
make_transparent("NotifyWARNBody")
make_transparent("NotifyTRACEBody")
make_transparent("NotifyDEBUGBody")
make_transparent("NotifyINFOTitle")
make_transparent("NotifyERRORTitle")
make_transparent("NotifyWARNTitle")
make_transparent("NotifyTRACETitle")
make_transparent("NotifyDEBUGTitle")
make_transparent("NotifyINFOBorder")
make_transparent("NotifyERRORBorder")
make_transparent("NotifyWARNBorder")
make_transparent("NotifyTRACEBorder")
make_transparent("NotifyDEBUGBorder")

-- LSP document highlight (variable occurrences under cursor)
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#4a8f4a", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#4a8f4a", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#4a8f4a", fg = "#cdd6f4" })

-- Search highlights
vim.api.nvim_set_hl(0, "Search", { bg = "#4a8f4a", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#6fbf6f", fg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#6fbf6f", fg = "#1e1e2e" })
