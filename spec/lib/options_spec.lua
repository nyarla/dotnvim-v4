local options = require("lib.options")

describe("lib", function()
  it("options#opt", function()
    options.opt("shiftwidth", 3)

    assert.is(vim.opt.shiftwidth, 3)
  end)
end)
