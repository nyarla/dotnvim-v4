local M = {}

M.lazy = {
  repo = "https://github.com/folke/lazy.nvim.git",
  rev = "7e6c863bc7563efbdd757a310d17ebc95166cef3", -- v11.16.2
  path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
}

function M.doing(tasks)
  for _, task in ipairs(tasks) do
    local result = vim.system(task[1], task[2]):wait()
    if result.code ~= 0 then
      vim.print("failed to run command: " .. tables.concat(tasks[1], " "))
      os.exit(1)
    end
  end
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
  if not M.stat(M.lazy.path) then
    M.doing({
      { { "mkdir", "-p", M.lazy.path } },
      { { "git", "init" }, opts },
      { { "git", "remote", "add", "origin", M.lazy.repo }, opts },
    })
  end

  M.doing({
    { { "git", "fetch", "origin", M.lazy.rev }, opts },
    { { "git", "reset", "--hard", M.lazy.rev }, opts },
  })
end

function M.setup()
  if M.rev() ~= M.lazy.rev then
    M.init()
  end

  vim.opt.rtp:prepend(M.lazy.path)

  require("lazy").setup({
    spec = {
      { import = "plugins" },
    },
  })
end

return M
