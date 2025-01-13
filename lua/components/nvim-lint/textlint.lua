local lib = require("lib.path")

local defaultTextlintPath = vim.env.HOME .. "/Applications/Programs/textlint/node_modules/.bin/textlint"
local defaultTextlintrcPath = vim.env.HOME .. "/Applications/Programs/textlint/ja/.textlintrc.yaml"

local function detectTextlintrc()
  local path = vim.fn.expand("%:p")
  local root = vim.fn.getcwd()
  local fn = ".textlintrc"
  local exts = { "cjs", "js", "json", "yaml", "yml" }

  if string.sub(path, 0, #root) ~= root then
    return "--config=" .. defaultTextlintrcPath
  end

  local ok, rc = pcall(lib.findup, fn, path, root, exts)
  if ok then
    return "--config=" .. rc
  end

  return "--config=" .. defaultTextlintrcPath
end

local function detectTextlint()
  local path = vim.fn.expand("%:p")
  local root = vim.fn.getcwd()
  local fn = "/node_modules/.bin/textlint"

  if string.sub(path, 0, #root) ~= root then
    return defaultTextlintPath
  end

  local ok, exe = pcall(lib.findup, fn, path, root)
  if not ok then
    return defaultTextlintPath
  end

  return lib.findexe({ exe, defaultTextlintPath })
end

local function filename()
  return "--stdin-filename=" .. vim.fn.expand("%:p")
end

local linter = {
  cmd = detectTextlint(),
  stdin = true,
  stream = "stdout",
  ignore_exitcode = false,
  args = {
    "--stdin",
    "--format=json",
    filename,
    detectTextlintrc,
  },
  parser = function(src)
    local severity = {
      vim.diagnostic.severity.INFO,
      vim.diagnostic.severity.WARN,
      vim.diagnostic.severity.ERROR,
    }

    local ok, decoded = pcall(vim.json.decode, src)
    if not ok then
      return {}
    end

    local data = decoded[1]
    local file = data.filePath
    local messages = data.messages

    local diagnostic = {}

    for _, msg in ipairs(messages) do
      if msg.type == "lint" then
        table.insert(diagnostic, {
          file = file,
          lnum = msg.loc.start.line - 1,
          end_lnum = msg.loc["end"].line - 1,
          col = msg.loc.start.column - 1,
          end_col = msg.loc["end"].column - 1,
          source = msg.ruleId,
          message = msg.message,
          severity = severity[msg.severity + 1],
        })
      end
    end

    return diagnostic
  end,
}

return linter
