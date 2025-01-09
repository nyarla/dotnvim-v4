local options = require("lib.options")

describe("lib", function()
  it("options#opt", function()
    options.opt("shiftwidth", 3)

    assert.is.equal(vim.opt.shiftwidth["_value"], 3)
  end)
end)
