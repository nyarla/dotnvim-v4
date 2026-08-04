local M = {}

M.lazy = {
  repo = "https://github.com/folke/lazy.nvim.git",
  rev = require("plugins.lazy").commit,
  path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
}

function M.exec(tasks)
  for _, task in ipairs(tasks) do
    local result = vim.system(task[1], task[2]):wait()
    if result.code ~= 0 then
      vim.print("failed to execute command: " .. table.concat(task[1], " "))
      return false
    end
  end

  return true
end

function M.stat(path)
  return (vim.uv or vim.loop).fs_stat(path)
end

function M.rev()
  if not M.stat(M.lazy.path) then
    return nil
  end

  local result = vim.system({ "git", "show" }, { cwd = M.lazy.path }):wait()
  if result.code ~= 0 then
    return nil
  end

  return string.match(result.stdout, "^commit (%x+)\n")
end

function M.init()
  local opts = { cwd = M.lazy.path }

  -- setup lazy.nvim repository
  if not M.stat(M.lazy.path) then
    M.exec({
      { { "mkdir", "-p", M.lazy.path } },
      { { "git", "init" }, opts },
      { { "git", "remote", "add", "origin", M.lazy.repo }, opts },
    })
  end

  -- update lazy.nvim
  if M.rev() ~= M.lazy.rev then
    M.exec({
      { { "git", "fetch", "origin", M.lazy.rev }, opts },
      { { "git", "reset", "--hard", M.lazy.rev }, opts },
    })
  end
end

function M.setup()
  M.init()

  vim.opt.rtp:prepend(M.lazy.path)
  require("lazy").setup({
    spec = {
      { import = "plugins" },
    },
  })
end

return M
