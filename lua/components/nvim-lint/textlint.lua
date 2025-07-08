local lib = require("lib.path")

local textlintRepository = vim.env.HOME .. "/Applications/Programs/textlint"
local textlintDefaultBin = vim.env.HOME .. "/Applications/Programs/textlint/bin/textlint"

local function detectLanguage()
  if vim.g.textlintrc ~= nil then
    return vim.g.textlintrc
  end

  return "ja"
end

local function detectTextlintrc()
  local path = vim.fn.expand("%:p")
  local root = vim.fn.getcwd()
  local fn = ".textlintrc"
  local exts = { "cjs", "js", "json", "yaml", "yml" }

  local lang = detectLanguage()
  local defaultTextlintrcPath = textlintRepository .. "/" .. lang .. "/.textlintrc.yaml"

  if string.sub(path, 0, #root) ~= root then
    return "--config=" .. defaultTextlintrcPath
  end

  local ok, rc = pcall(lib.findup, fn, path, root, exts)
  if ok and rc ~= nil then
    return "--config=" .. rc
  end

  return "--config=" .. defaultTextlintrcPath
end

local function detectTextlint()
  local path = vim.fn.expand("%:p")
  local root = vim.fn.getcwd()
  local fn = "/node_modules/.bin/textlint"

  if string.sub(path, 0, #root) ~= root then
    return textlintDefaultBin
  end

  local ok, exe = pcall(lib.findup, fn, path, root)
  if ok and exe ~= nil then
    return lib.findexe({ exe, textlintDefaultBin })
  end

  return textlintDefaultBin
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
