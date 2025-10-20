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
