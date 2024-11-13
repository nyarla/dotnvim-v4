local theme = require("lib.theme")

describe("lib", function()
  it("theme", function()
    for idx = 0, 20, 1 do
      local key = "gray" .. (5 * idx)

      assert.truthy(theme[key])
    end

    local keys = { "red", "orange", "yellow", "rime", "green", "cyan", "sky", "blue", "purple", "pink" }
    for _, name in ipairs(keys) do
      for idx = 1, 19, 1 do
        local key = name .. (idx * 5)

        assert.truthy(theme[key])
      end
    end
  end)
end)
