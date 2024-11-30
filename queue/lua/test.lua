L = require('luaunit')
local ds = require('ds');


function TestQueue()
  local lst = nil
  local val = nil
  lst = ds.enqueue(lst, 5)
  lst = ds.enqueue(lst, 7)
  lst = ds.enqueue(lst, 9)
  lst, val = ds.dequeue(lst, nil)
  L.assertEquals(val, 5)
  L.assertEquals(ds.length(lst), 2)

  lst = ds.enqueue(lst, 11)
  lst, val = ds.dequeue(lst)
  L.assertEquals(val, 7)
  lst, val = ds.dequeue(lst)
  L.assertEquals(val, 9)
  val = ds.peek(lst)
  L.assertEquals(val, 11)
  lst, val = ds.dequeue(lst)
  L.assertEquals(val, 11)
  lst, val = ds.dequeue(lst)
  L.assertEquals(val, nil)
  L.assertEquals(ds.length(lst), 0)

  lst = ds.enqueue(lst, 69)
  val = ds.peek(lst)
  L.assertEquals(val, 69)
  L.assertEquals(ds.length(lst), 1)
end

os.exit(L.LuaUnit.run())
