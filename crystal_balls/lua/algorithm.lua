-- @param arr A table behaving as an array.
-- @return The max index where the crystal ball break
local function two_crystal_balls(arr)
  -- jumpsize is the sqrt of the length of the array
  -- and we start at the first jump point
  local jumpsize = math.floor(math.sqrt(#arr)) -- no need to +1 because lua array is inclusive at end
  local i = jumpsize
  while true do
    if arr[i] then
      break
    else
      i = i + jumpsize
    end

    if i >= #arr then
      return -1
    end
  end

  -- jumpsize now becomes 1 and we start at the last successful drop or 0
  i = i - jumpsize
  jumpsize = 1
  while true do
    if arr[i] then
      break
    else
      i = i + 1
    end
  end
  return i
end

-- @class TwoCrystalBalls
local M = {}
M.two_crystal_balls = two_crystal_balls
return M
