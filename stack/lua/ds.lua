local function node(val)
  return { ["value"] = val, ["next"] = nil }
end

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

local function push(head, v)
  local len = length(head)
  if len == 0 then
    local newnode = node(v)
    return newnode
  else
    local newnode = node(v)
    newnode.next = head
    return newnode
  end
end

local function pop(head)
  local len = length(head)
  if len == 0 then
    return nil
  else
    local newhead = head.next
    local oldhead = head
    return newhead, oldhead.value
  end
end

local function peek(head)
  local len = length(head)
  if len == 0 then
    return nil
  else
    return head.value
  end
end

local M = {}
M.push = push
M.pop = pop
M.peek = peek
M.length = length
return M
