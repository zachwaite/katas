L = require('luaunit')
local ds = require('ds');


function TestSinglyLinkedList()
  local lst = nil
  local val = nil
  lst = ds.append(lst, 5)
  lst = ds.append(lst, 7)
  lst = ds.append(lst, 9)
  lst, val = ds.get(lst, 2)
  L.assertEquals(val, 9)
  lst, val = ds.remove_at(lst, 1)
  L.assertEquals(val, 7)
  L.assertEquals(ds.length(lst), 2)

  lst = ds.append(lst, 11)
  lst, val = ds.remove_at(lst, 1)
  L.assertEquals(val, 9)
  lst, val = ds.remove(lst, 9)
  L.assertEquals(val, nil)
  lst, val = ds.remove_at(lst, 0)
  L.assertEquals(val, 5)
  lst, val = ds.remove_at(lst, 0)
  L.assertEquals(val, 11)
  L.assertEquals(ds.length(lst), 0)

  lst = ds.prepend(lst, 5)
  lst = ds.prepend(lst, 7)
  lst = ds.prepend(lst, 9)
  lst, val = ds.get(lst, 2)
  L.assertEquals(val, 5)
  lst, val = ds.get(lst, 0)
  L.assertEquals(val, 9)
  lst, val = ds.remove(lst, 9)
  L.assertEquals(val, 9)
  L.assertEquals(ds.length(lst), 2)
  lst, val = ds.get(lst, 0)
  L.assertEquals(val, 7)
end

os.exit(L.LuaUnit.run())
