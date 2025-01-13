local M = {}

---@param path string the find name of file
---@param start string the start dir to find file
---@param root string the end of directory for findings
---@param exts? table<string> the extensions list to append filename
function M.findup(path, start, root, exts)
  if string.sub(start, 0, #root) ~= root then
    error(string.format("start directory is not inside root directory: start: %s: root: %s", start, root))
  end

  local begin = string.sub(start, #root + 1)
  local dirs = {}
  for dir in string.gmatch(begin, "([^/]+)") do
    table.insert(dirs, dir)
  end

  while #dirs ~= 0 do
    local fn = { root }
    for _, dir in ipairs(dirs) do
      table.insert(fn, dir)
    end

    table.insert(fn, path)

    local fp = table.concat(fn, "/")

    if vim.fn.filereadable(fp) == 1 then
      return fp
    end

    if exts ~= nil then
      for _, ext in ipairs(exts) do
        local fpe = fp .. "." .. ext
        if vim.fn.filereadable(fpe) == 1 then
          return fpe
        end
      end
    end

    table.remove(dirs)
  end

  local fp = table.concat({ root, path }, "/")

  if vim.fn.filereadable(fp) == 1 then
    return fp
  end

  if exts ~= nil then
    for _, ext in ipairs(exts) do
      local fpe = fp .. "." .. ext
      if vim.fn.filereadable(fpe) == 1 then
        return fpe
      end
    end
  end

  return nil
end

---@param executables table<string> the list of executable file names
function M.findexe(executables)
  for _, exe in ipairs(executables) do
    if vim.fn.executable(exe) == 1 then
      return exe
    end
  end

  return nil
end

return M
