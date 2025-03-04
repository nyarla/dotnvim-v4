local lib = require("lib.buffer")

describe("lib", function()
  it("buffer#is_special", function()
    assert.Falsy(lib.is_special())
  end)

  it("buffer#is_file", function()
    assert.Truthy(lib.is_file())
  end)

  it("buffer#is_active", function()
    assert.Falsy(lib.is_active())
  end)

  it("buffer#is_inactive", function()
    assert.Truthy(lib.is_inactive())
  end)
end)
