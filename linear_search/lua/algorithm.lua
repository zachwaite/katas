--- Perform a linear search on an array and return the index if found
-- This algorithm has a running time of O(N)
-- @param arr A table behaving as an array.
-- @param val The value you are searching for.
-- @return The index where you find the value OR nil
-- @return An error you encounter OR nil
local function linear_search(arr, val)
  for i = 1, #arr, 1 do
    if arr[i] == val then
      return i, nil
    end
  end
  return nil, "NotFound"
end

-- @class LinearSearchModule
local M = {}
M.linear_search = linear_search
return M
