local lib = require("lib.path")

describe("lib", function()
  it("path#findup", function()
    assert.has.errors(function()
      lib.findup("foo", "/bar", "/baz")
    end)

    local root = vim.fn.getcwd()
    local start = root .. "/spec/lib"
    local fn = "init.lua"

    assert.are.same(lib.findup(fn, start, root), root .. "/init.lua")
    assert.are.same(lib.findup("init", start, root, { "lua" }), root .. "/init.lua")
  end)

  it("path#findexe", function()
    assert.is.truthy(lib.findexe({ "nvim" }))
    assert.is.falsy(lib.findexe({ "this-command-does-not-exists" }))
  end)
end)
