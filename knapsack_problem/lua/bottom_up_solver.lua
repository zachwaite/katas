local cjson = require("cjson")
local open = io.open


local function json_load(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return cjson.decode(content)
end

local function prepare_items(raw_items)
  local out = {}
  for i, rec in ipairs(raw_items) do
    table.insert(out, {index=i, value=rec.value, weight=rec.weight})
  end
  return out
end

local function matrix2d(nrows, ncols, init)
  -- using the table like a hashmap here because the j key actually represents
  -- something meaningful (a capacity) instead of just an index
  -- e.g. j = 0 means a knapsack with capacity of 0 weight units
  -- and j = 4 means a knapsack with capacity of 4 weight units
  local M = {}
  for i = 0, nrows - 1 do
    local row = {}
    for j = 0, ncols - 1 do
      row[j] = init
    end
    M[i] = row
  end
  return M
end

local function print_matrix2d(t)
  local max_i = nil -- mutate in loop
  local max_j = nil -- mutate in loop
  print("[")
  for i=0, #t do
    max_i = i
    local row = "  [" .. i .. "] = " .. "["
    for j = 0, #t[i] do
      max_j = j
      row = row .. t[i][j] .. ", "
    end
    row = row .. "]"
    print(row)
  end
  print("]")
  print("Max value: " .. t[max_i][max_j])
end


local function dynamic_programming_solver(max_capacity, items)
  -- build matrix, adding a row for 0 (no items) and a col for 0 (no capacity)
  local M = matrix2d(#items + 1, max_capacity + 1, 0)

  -- fill matrix
  for i=1, #items do
    for capacity = 1, max_capacity do
      local max_val_without_current = M[i - 1][capacity]
      local max_val_with_current = 0 -- will mutate this

      local current_item = items[i] -- items is 1 indexed

      if capacity >= current_item.weight then
        max_val_with_current = current_item.value
        local remainingCapacity = capacity - current_item.weight
        local max_value_of_remaining_capacity = M[i-1][remainingCapacity]
        max_val_with_current = max_val_with_current + max_value_of_remaining_capacity
      end
      M[i][capacity] = math.max(max_val_without_current, max_val_with_current)
    end
  end
  return M
end


-- main
local path = arg[1]
local t = json_load(path)
local max_capacity = t.knapsack_capacity
local items = prepare_items(t.items)
local rs = dynamic_programming_solver(max_capacity, items)
print_matrix2d(rs)
