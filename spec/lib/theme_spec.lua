local theme = require("lib.theme")

describe("lib", function()
  it("theme", function()
    for idx = 0, 20, 1 do
      local key = "gray" .. (5 * idx)

      assert.truthy(theme[key])
      assert.is.equal(string.len(theme[key]), 7)
      assert.truthy(string.match(theme[key], "^#([a-fA-F0-9]+)"))
    end

    local keys = { "red", "orange", "yellow", "rime", "green", "cyan", "sky", "blue", "purple", "pink" }
    for _, name in ipairs(keys) do
      for idx = 1, 19, 1 do
        local key = name .. (idx * 5)

        assert.truthy(theme[key])
        assert.is.equal(string.len(theme[key]), 7)
        assert.truthy(string.match(theme[key], "^#([a-fA-F0-9]+)"))
      end
    end

    for _, name in ipairs({ "light", "dark" }) do
      for _, val in pairs(theme[name]) do
        assert.truthy(val)
        assert.truthy(string.match(val, "^#([a-fA-F0-9]+)"))
      end
    end
  end)
end)
