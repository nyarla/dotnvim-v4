local M = {}

---@return string the os name about nvim running on
function M.detect_os()
  if vim.fn.filereadable("/etc/NIXOS") == 1 then
    return "nixos"
  end

  if vim.fn.executable("sw_vers") == 1 then
    return "macos"
  end

  if vim.fn.executable("explorer.exe") == 1 then
    return "windows"
  end

  if vim.fn.system("uname -s") == "Linux\n" then
    return "linux"
  end

  return "unsupported"
end

return M
