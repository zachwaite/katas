--- Bubble sort an array in place
-- This algorithm has a running time of O(N^2)
-- @param arr A table behaving as an array.
local function bubble_sort(arr)
  for i = 1, #arr + 1, 1 do
    for j = 1, #arr - i, 1 do
      if arr[j] > arr[j + 1] then
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
    end
  end
end

-- @class BubbleSortModule
local M = {}
M.bubble_sort = bubble_sort
return M
