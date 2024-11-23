L = require('luaunit')
local algo = require('algorithm');


function TestLs01()
  local arr = { "a", "b", "c", "d" }
  local idx, err = algo.linear_search(arr, "a")
  L.assertIsNil(err)
  L.assertEquals(idx, 1)
end

function TestLs02()
  local arr = { "a", "b", "c", "d" }
  local idx, err = algo.linear_search(arr, "d")
  L.assertIsNil(err)
  L.assertEquals(idx, 4)
end

os.exit(L.LuaUnit.run())
