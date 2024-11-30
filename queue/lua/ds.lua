local function node(val)
  return { ["value"] = val, ["next"] = nil }
end

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

local function enqueue(head, v)
  local new_node = node(v)
  local n = tail(head)
  if n then
    n.next = new_node
  else
    head = new_node
  end
  return head
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

local function dequeue(head)
  local p = nil
  local n = head
  while n do
    if p then
      if n then
        p.next = n.next
        return head, n.value
      else
        return head, nil
      end
    else
      -- i = 0
      if n then
        return n.next, n.value
      else
        return nil, nil
      end
    end
  end
end

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

local function peek(head)
  if head then
    return head.value
  else
    return nil
  end
end

local M = {}
M.enqueue = enqueue
M.length = length
M.dequeue = dequeue
M.peek = peek
M.repr = repr
return M
