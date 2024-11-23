L = require('luaunit')
local algo = require('algorithm');


function TestTwoCrystalBalls01()
  local idx = math.floor(math.random() * 10000)
  local data = {}
  for i = 1, 10001, 1 do
    if i >= idx then
      data[i] = true
    else
      data[i] = false
    end
  end
  local expected = idx
  local observed = algo.two_crystal_balls(data)
  L.assertEquals(observed, expected)
end

function TestTwoCrystalBalls02()
  local data = {}
  for i = 1, 821, 1 do
    data[i] = false
  end
  local expected = -1
  local observed = algo.two_crystal_balls(data)
  L.assertEquals(observed, expected)
end

os.exit(L.LuaUnit.run())
