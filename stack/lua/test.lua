L = require('luaunit')
local ds = require('ds');


function TestStack()
  local val = nil
  local stk = nil
  stk = ds.push(stk, 5)
  stk = ds.push(stk, 7)
  stk = ds.push(stk, 9)
  stk, val = ds.pop(stk)
  L.assertEquals(val, 9)
  L.assertEquals(ds.length(stk), 2)

  stk = ds.push(stk, 11)
  stk, val = ds.pop(stk)
  L.assertEquals(val, 11)
  stk, val = ds.pop(stk)
  L.assertEquals(val, 7)
  L.assertEquals(ds.peek(stk), 5)
  stk, val = ds.pop(stk)
  L.assertEquals(val, 5)

  stk = ds.push(stk, 69)
  L.assertEquals(ds.peek(stk), 69)
  L.assertEquals(ds.length(stk), 1)
  stk, val = ds.pop(stk)
  L.assertEquals(val, 69)
  L.assertEquals(ds.length(stk), 0)
  stk, val = ds.pop(stk)
  L.assertEquals(val, nil)
  L.assertEquals(ds.length(stk), 0)
end

os.exit(L.LuaUnit.run())
