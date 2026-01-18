-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rb", function()
  local root = vim.fs.find({ ".git", "build.bat" }, { upward = true })[1]
  if not root then
    vim.notify("No project root or build.bat found", vim.log.levels.WARN)
    return
  end
  local root_dir = vim.fs.dirname(root)
  local build_file = root_dir .. "/build.bat"
  if vim.fn.filereadable(build_file) == 1 then
    local args = "clean build"
    local cmd = "cd " .. root_dir .. " && build.bat " .. vim.fn.shellescape(args)
    local output = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.notify("Error running build.bat:\n" .. output, vim.log.levels.ERROR)
    else
      vim.notify("build.bat output:\n" .. output, vim.log.levels.INFO)
    end
  else
    vim.notify("build.bat not found in " .. root_dir, vim.log.levels.ERROR)
  end
end, { desc = "Run build.bat in project root with arguments and show output" })

vim.keymap.set("n", "<leader>rr", function()
  local root = vim.fs.find({ ".git", "build-run.bat" }, { upward = true })[1]
  if not root then
    vim.notify("No project root or build-run.bat found", vim.log.levels.WARN)
    return
  end
  local root_dir = vim.fs.dirname(root)
  local build_file = root_dir .. "/build-run.bat"
  if vim.fn.filereadable(build_file) == 1 then
    local args = "clean build"
    local cmd = "cd " .. root_dir .. " && build-run.bat " .. vim.fn.shellescape(args)
    local output = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.notify("Error running build-run.bat:\n" .. output, vim.log.levels.ERROR)
    else
      vim.notify("build-run.bat output:\n" .. output, vim.log.levels.INFO)
    end
  else
    vim.notify("build-run.bat not found in " .. root_dir, vim.log.levels.ERROR)
  end
end, { desc = "Run build-run.bat in project root with arguments and show output" })

vim.keymap.set("n", "<leader>rd", function()
  local root = vim.fs.find({ ".git", "debug.bat" }, { upward = true })[1]
  if not root then
    vim.notify("No project root or debug.bat found", vim.log.levels.WARN)
    return
  end

  local root_dir = vim.fs.dirname(root)
  local build_file = root_dir .. "/debug.bat"

  if vim.fn.filereadable(build_file) == 1 then
    vim.cmd("!cd " .. root_dir .. " && debug.bat")
  else
    vim.notify("debug.bat not found in " .. root_dir, vim.log.levels.ERROR)
  end
end, { desc = "Run debug.bat in project root" })

vim.keymap.set("n", "<leader>bs", ":w<CR>", {
  noremap = true,
  silent = true,
  desc = "Save current buffer",
})

-- Helper function to get visual selection
local function get_visual_selection()
  local _, ls, cs = unpack(vim.fn.getpos("v"))
  local _, le, ce = unpack(vim.fn.getpos("."))
  if ls > le or (ls == le and cs > ce) then
    ls, le, cs, ce = le, ls, ce, cs
  end
  local lines = vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce, {})
  return table.concat(lines, "\n")
end

-- Find in file (native search)
vim.keymap.set("n", "<C-f>", "/", { desc = "Find in file" })
vim.keymap.set("v", "<C-f>", function()
  local text = get_visual_selection()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  vim.fn.setreg("/", "\\V" .. vim.fn.escape(text, "\\"))
  vim.cmd("set hlsearch")
  vim.api.nvim_feedkeys("n", "n", false)
end, { desc = "Find selection in file" })

-- Find in all files (snacks picker grep)
vim.keymap.set("n", "<C-S-f>", function()
  Snacks.picker.grep()
end, { desc = "Find in all files" })
vim.keymap.set("v", "<C-S-f>", function()
  Snacks.picker.grep({ search = get_visual_selection() })
end, { desc = "Find selection in all files" })