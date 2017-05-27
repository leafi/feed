-- Adds convenience funcs to table.

function table.getsortedkeys(t)
  local p = {}
  for k, _ in pairs(t) do
    p[#p+1] = k
  end
  table.sort(p)
  return p
end

function table.deepcopy(from, to)
  local from_type = type(from)
  if from_type == 'table' then
    local copy = to or {}
    for fk, fv in next, from, nil do
      copy[table.deepcopy(fk)] = table.deepcopy(fv)
    end
    setmetatable(copy, table.deepcopy(getmetatable(from)))
    return copy
  else
    return from
  end
end

function table.containsv(t, v2)
  for _, v in pairs(t) do
    if v == v2 then return true end
  end
  return false
end

function table.ifind(t, v2)
  for i, v in ipairs(t) do
    if v == v2 then return i end
  end
  return nil
end

function table.pack(...)
  -- stolen from the interwebs...
  return {n = select('#', ...); ...}
end
