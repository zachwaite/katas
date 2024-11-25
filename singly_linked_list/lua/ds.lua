--- Construct a new node for the provided value
-- @param val The value to store in the node
-- @return A table representing the new node with keys (value, next)
local function node(val)
  return { ["value"] = val, ["next"] = nil }
end

--- Add a new node to the front of the list
-- This as running time of O(1)
-- @param head The head node of the linked list
-- @param v The value to add to a node at the front of the list
-- @return The new head node
local function prepend(head, v)
  local new_head = node(v)
  if head then
    new_head.next = head
  end
  return new_head
end

--- Get the last node in the list
-- This as running time of O(N) as it has to traverse to the end
-- @param head The head node of the linked list
-- @return The tail node or nil
local function tail(head)
  local n = head
  while n do
    if n.next then
      n = n.next
    else
      break
    end
  end
  return n
end

--- Add a new node to the end of the list
-- This as running time of O(N)
-- @param head The head node of the linked list
-- @param v The value to add to a node at the end of the list
-- @return The same head node
local function append(head, v)
  local new_node = node(v)
  local n = tail(head)
  if n then
    n.next = new_node
  else
    head = new_node
  end
  return head
end

--- Get a last node in the list at the provided index
-- This as running time of O(N)
-- @param head The head node of the linked list
-- @param idx The index you're seeking the value at
-- @return The head node
-- @return The value of the node at the provided index
local function get(head, idx)
  local n = head
  local i = 0
  while i < idx do
    if n.next then
      n = n.next
      i = i + 1
    else
      return nil, nil
    end
  end
  return head, n.value
end

--- Remove the node at the provided index
-- This as running time of O(N)
-- @param head The head node of the linked list
-- @param idx The index of the node you're removing
-- @return The (potentially new) head node
-- @return The value at the idx you just removed
local function remove_at(head, idx)
  local p = nil
  local n = head
  local i = 0
  while i < idx do
    if n.next then
      p = n
      n = n.next
      i = i + 1
    else
      return nil
    end
  end

  if p then
    -- i > 0
    if n then
      if n.next then
        p.next = n.next
        return head, n.value
      else
        p.next = nil
        return head, n.value
      end
    else
      return nil, nil
    end
  else
    -- i = 0
    if n then
      if n.next then
        return n.next, n.value
      else
        return nil, n.value
      end
    else
      return nil, nil
    end
  end
end

--- Get the number of nodes in the list
-- This as running time of O(N)
-- @param head The head node of the linked list
-- @return The number of nodes in the list
local function length(head)
  local n = head
  local count = 0
  while n do
    count = count + 1
    if n.next then
      n = n.next
    else
      break
    end
  end
  return count
end

--- Remove the first node with the provided value
-- This as running time of O(N)
-- @param head The head node of the linked list
-- @param val The value of the node you're removing
-- @return The (potentially new) head node
-- @return The value at the node you just removed
local function remove(head, val)
  local p = nil
  local n = head
  while n do
    if n.value == val then
      if p then
        if n then
          if n.next then
            p.next = n.next
            return head, val
          else
            return head, nil
          end
        else
        end
      else
        -- i = 0
        if n then
          if n.next then
            return n.next, val
          else
            return nil, val
          end
        else
          return nil, nil
        end
      end
    else
      p = n
      n = n.next
    end
  end
  return head, nil
end

--- Print a string repr of the linked list
-- @param head The head node of the linked list
-- @return A string e.g. "5 -> 7"
local function repr(head)
  local out = ""
  local n = head
  while n do
    if out ~= "" then
      out = out .. "->" .. n.value
    else
      out = out .. n.value
    end
    n = n.next
  end
  return out
end

-- @class LinearSearchModule
local M = {}
M.prepend = prepend
M.append = append
M.get = get
M.remove_at = remove_at
M.length = length
M.remove = remove
M.repr = repr
return M
