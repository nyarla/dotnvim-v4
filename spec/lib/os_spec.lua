local lib = require("lib.os")

describe("lib", function()
  it("os#detect_os", function()
    assert.are.same(lib.detect_os(), "linux")
  end)
end)
