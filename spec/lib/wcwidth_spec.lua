local data = require("lib.wcwidth")

describe("lib", function()
  it("wcwidth", function()
    for _, v in ipairs(data) do
      assert.is(type(v[1]), "number")
      assert.is(type(v[2]), "number")
      assert.is(type(v[3]), "number")

      assert.truthy(v[3] == 1 or v[3] == 2)
    end
  end)
end)
