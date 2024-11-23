L = require('luaunit')
local algo = require('algorithm');


function TestBubbleSort()
  local arr = { 9, 3, 7, 4, 69, 420, 42 }
  algo.bubble_sort(arr)
  local expected = { 3, 4, 7, 9, 42, 69, 420 }
  for i = 1, #arr, 1 do
    L.assertEquals(arr[i], expected[i])
  end
end

os.exit(L.LuaUnit.run())
