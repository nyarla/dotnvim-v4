local c = require("config.plugins")

describe("config", function()
  it("plugins#lazy", function()
    assert.truthy(c.lazy.repo)
    assert.truthy(c.lazy.rev)
    assert.truthy(c.lazy.path)
  end)

  it("plugins#init", function()
    c.init()
    assert.is(c.stat(c.lazy.path .. "/.git").type, "directory")
    assert.is(c.rev(), c.lazy.rev)

    c.init()
    assert.is(c.rev(), c.lazy.rev)
  end)
end)
