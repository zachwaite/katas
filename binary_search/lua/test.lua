L = require('luaunit')
local algo = require('algorithm');

function TestBinarySearch()
  local arr = { 1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420 }
  L.assertIsTrue(algo.binary_search(arr, 69))
  L.assertIsFalse(algo.binary_search(arr, 1336))
  L.assertIsTrue(algo.binary_search(arr, 69420))
  L.assertIsFalse(algo.binary_search(arr, 69421))
  L.assertIsTrue(algo.binary_search(arr, 1))
  L.assertIsFalse(algo.binary_search(arr, 0))
end

os.exit(L.LuaUnit.run())
