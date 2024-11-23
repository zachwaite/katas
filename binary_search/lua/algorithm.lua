--- Perform a binary search on an array and return true if found
-- This algorithm has a running time of O(log(N))
-- remember [low, high) = low is inclusive, high is exclusive
-- @param arr An ORDERED table of NUMBERS behaving as an array.
-- @param val The value you are searching for.
-- @return bool True if found, else False
local function binary_search(arr, val)
  local lo = 1 -- in lua need to start with 1 and add an extra 1 to the end for the midpoint calc
  local hi = #arr + 1;

  repeat
    local m = math.floor(lo + (hi - lo) / 2)
    local v = arr[m];

    if v == val then
      return true
    elseif v > val then
      hi = m
    else
      lo = m + 1
    end
  until (lo >= hi)

  return false
end

-- @class LinearSearchModule
local M = {}
M.binary_search = binary_search
return M
