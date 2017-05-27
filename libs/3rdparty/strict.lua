-- strict.lua
-- checks uses of undeclared global variables
-- All global variables must be 'declared' through a regular assignment
-- (even assigning nil will do) in a main chunk before being used
-- anywhere or assigned to inside a function.
-- distributed under the Lua license: http://www.lua.org/license.html

local getinfo, error, rawset, rawget = debug.getinfo, error, rawset, rawget

local mt = getmetatable(_G)
if mt == nil then
  mt = {}
  setmetatable(_G, mt)
end

mt.__declared = {}

local function what ()
  local d = getinfo(3, "Sl")
  return d and d.what or "C", d and d.short_src, d and d.currentline
end

mt.__newindex = function (t, n, v)
  if not mt.__declared[n] then
    -- Disabled by leaf. We manage our globals reasonably well, albeit from multiple files;
    -- I'm only interested in catching reads from undefined vars, not writes.
    --local w = what()
    --if w ~= "main" and w ~= "C" then
    --  error("assign to undeclared variable '"..n.."'", 2)
    --end
    mt.__declared[n] = true
  end
  rawset(t, n, v)
end

mt.__index = function (t, n)
  if not mt.__declared[n] and what() ~= "C" then
    -- leaf change: mo return args from what()
    local _, ss, l = what()
    -- leaf change: let LoveFrames do whatever the hell it wants
    if string.find(ss, "LoveFrames") then return rawget(t, n) end
    -- leaf change: material-love likes its globals, too...
    if string.find(ss, "material-love", 1, true) then return rawget(t, n) end
    -- leaf change: fucking libcurl...
    if string.find(ss, "libcurl") then return rawget(t, n) end
    -- leaf change: improved error messages. (on my setup, anyway!)
    error("Attempt to read from unset global '" .. n .. "' in:\n\n" .. ss .. ":" .. l)
    --error("variable '"..n.."' is not declared", 2)
  end
  return rawget(t, n)
end
